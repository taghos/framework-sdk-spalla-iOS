# Spalla SDK

Spalla SDK contains a player solution that can automatically handle any content from Spalla and generate Analytics automatically

# Installation

### Pre-requisites

SpallaSDK requires iOS 13. If you need to support a lower version, please contact us. It's on the road map to separate SwiftUI from UIKit so it's possible to prioritize it if needed.

Spalla required THEOPlayer added to the project to work properly. Depending on the version used, you may have to install GoogleInteractiveMediaAds and GoogleCast. Please follow the instructions from THEO player installation page.

### Cocoapods

```rb
pod 'SpallaSDK'
```

### Swift Package Manager

Open the project > Package Dependencies and click on the "+" sign. Then just add a link this git repository on the search and it should fetch the SDK automatically. 

```
https://github.com/taghos/framework-sdk-spalla-iOS
```

### Manually

Download the latest release. Drag SpallaSDK.xcframework (make sure to copy if needed if the files are outside your project). Go to the project and change to Embed & Sign for SpallaSDK.


# Usage

At app start, call the initializer. You need to have a license from THEO player and a Spalla Token from us.

```swift
Spalla.shared.initialize(token: "{Spalla token}, license: "{Theo license}", applicationId: "{Chromecast application id}")
```

### UIKit

SpallaSDK comes with a custom view controller that can be used to play any Spalla content. 
```swift
let vc = SpallaPlayerViewController()
vc.setup(with: "{Spalla content_id}", isLive: false)
self.navigationController?.pushViewController(vc, animated: true)
```

### SwiftUI

We have a Player view that encapsulates the same view controller that is used on UIKit. Just add it to your swift code as this

```swift
SpallaPlayerSwiftUI(contentId: contentId, isLive: isLive)
```

# Events

The player will 

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