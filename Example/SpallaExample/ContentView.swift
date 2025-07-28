//
//  ContentView.swift
//  SpallaExample
//
//  Created by Rogerio Shimizu on 6/16/25.
//

import SwiftUI
import SpallaSDK

struct ContentView: View {
    @ObservedObject var playerController = PlayerController()
    
    var body: some View {
        VStack {
            SpallaPlayerSwiftUI(contentId: "Your content ID", hideUI: false, startTime: 70, subtitle: "pt-br", controller: playerController)
            Button(playerController.isPlaying ? "Pause" : "Play", action: {
                playerController.togglePlayPause()
            })
            Button("FF 10 secs", action: {
                playerController.seekTo(time: playerController.currentTime + 10)
            })
            HStack {
                Spacer()
                Text("Time: \(playerController.currentTime)")
                Spacer()
                Text("Buffering \(playerController.isBuffering.description)")
                Spacer()
            }
            HStack {
                Spacer()
                Button(playerController.subtitle == nil ? "Enable subtitles" : "Disable subtitles", action: {
                    playerController.selectSubtitle(subtitle: playerController.subtitle == nil ? "pt-br" : nil)
                })
                Spacer()
                Button(playerController.playbackRate == 1.0 ? "1x" : "2x", action: {
                     playerController.selectPlaybackRate(rate: playerController.playbackRate == 1.0 ? 2.0 : 1.0)
                })
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
    }
}

