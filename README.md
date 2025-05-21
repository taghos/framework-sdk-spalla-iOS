# Spalla SDK

Spalla SDK contains a player solution that can automatically handle any content from Spalla and generate Analytics automatically

# Installation

### Pre-requisites

SpallaSDK requires iOS 13. If you need to support a lower version, please contact us. It's on the road map to separate SwiftUI from UIKit so it's possible to prioritize it if needed.


### Cocoapods

CocoaPods is a dependency manager for Cocoa projects. For usage and installation instructions, visit their [website](https://www.cocoapods.org). To integrate SpallaSDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```rb
pod 'SpallaSDK'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding SpallaSDK as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/taghos/framework-sdk-spalla-iOS", .upToNextMajor(from: "0.9.1"))
]
```

### Manually

Download the latest release from [Github](https://github.com/taghos/framework-sdk-spalla-iOS/releases). Drag SpallaSDK.xcframework, THEOPlayer.xcframework and Googlecast.xcframework (make sure to copy if needed if the files are outside your project). Go to the project and change to Embed & Sign for all three frameworks.

# Usage

At app start, call the initializer. Pass your Chromecast receiver app id if you have one, otherwise just send nil.

```swift
Spalla.shared.initialize(applicationId: "{Chromecast application id}")
```

### UIKit

SpallaSDK comes with a custom view controller that can be used to play any Spalla content. 
```swift
let vc = SpallaPlayerViewController()
vc.setup(with: "{Spalla content_id}", isLive: false)
self.navigationController?.pushViewController(vc, animated: true)
```

The ViewController also exposes some player functions, like `play`, `pause`, `mute`, `unmute` and `seekTo`.

#### UIKit Events

The player will dispatch some key events while it's playing any content. The view controller has a method `registerPlayerListener` that subscribes a listener to receive events. The listener must conform to `SpallaPlayerListener` protocol, which has only a single method `onEvent`

| Event    | Parameters | Description |
| -------- | ------- | ------- |
| play | | User requested to play after pause or after initial load
| playing | | Video is actually playing or back to playing after buffer
| pause | | User requested a pause
| waiting | | video is being buffered
| ended | | video reached end time
| durationUpdate | time: TimeInterval | | the video duration updated. Usually only sent once after initial metadata is loaded
| error | error: String, canRetry: Bool | | sent when the video has any error, and if the error can be retried (like connection errors)
| timeUpdate | time: TimeInterval | the current time of the video
| muted | | when video is muted
| unmuted | | when video is unmuted
| subtitlesAvailable | subtitles: [String] | after initial load, event is dispatched with the available languages available, like ["pt-br", "en"]
| subtitleSelected | subtitle: String? | a subtitle is selected (also happens if a subtitle is set on setup)

### SwiftUI

We have a Player view that encapsulates the same view controller that is used on UIKit. Just add it to your swift code as this

```swift
SpallaPlayerSwiftUI(contentId: contentId, isLive: isLive, startTime: 0, subtitle: nil, controller: nil)
```

If you need to control the player from outside, pass a `PlayerController` to the view.

```swift
@ObservedObject var playerController = PlayerController()

var body: some View {
    VStack {
        SpallaPlayerSwiftUI(contentId: contentId, isLive: isLive, controller: playerController)
    }
}

```

The `PlayerController` allows you to call all player functions like `play`, `pause`, `seekTo`, `mute` and `unmute`. Also, as it's an `ObservableOject`, you can use it to track the state of the player. It exposes the player state with `isPlaying`, `isMuted`, `isBuffering`, `currentTime` and `duration`.

For example, you can add a label to display the current time and a play/pause button with something like this:

```swift
    @ObservedObject var playerController = PlayerController()
    let contentId: String = "some id"
    
    var body: some View {
        VStack {
            
            SpallaPlayerSwiftUI(contentId: contentId, isLive: false, controller: playerController)
            Button(playerController.isPlaying ? "Pause" : "Play", action: {
                playerController.togglePlayPause()
            })
            Button("FF 10 secs", action: {
                playerController.seekTo(time: playerController.currentTime + 10)
            })
            Text("Time: \(playerController.currentTime)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

```

# Customize UI

We have a default html UI that supports no customization currently. We are working on customization options, but it may take a while.

If you want, you may initialize the player with a hideUI option and implements the UI by yourself. 

### UIKit:

```
vc.setup(with: "{Spalla content_id}", isLive: false, hideUI: true)
```

### SwiftUI

```
SpallaPlayerSwiftUI(contentId: contentId, isLive: false, hideUI: true, startTime: 0, subtitle: nil, controller: playerController)
```

# Analytics

To enable Analytics, pass the Spalla user session token to the SDK after login

```swift
Spalla.shared.setSessionId(token: token)
```

This will enable all analytics on the Spalla Player automatically. No Analytics will be recorded if the session id is not set.


# Troubleshooting

- After I added the SDK and tried to compile, Swift reported "Failed to build module SpallaSDK"
-- make sure you added THEO Player to the project. Also, if you use Chromecast or GoogleInteractiveMediaAds with THEO Player, add the respective libraries to the project, as not having them will cause an issue when building the module.

- Video is not playing on landscape
-- The UIKit view controller will return landscape as the allowed orientation. Make sure that your app allows that orientation on both AppDelegate and in the project. 
