//
//  CustomVideoPlayer.swift
//  Store.s
//
//  Created by Sedra Asrawi on 06/09/2022.
//

import SwiftUI
import AVKit

// Custom Video Player from UIKit
struct CustomVideoPlayer: UIViewControllerRepresentable {
    
    var player: AVPlayer
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        
        controller.player = player
        controller.showsPlaybackControls = false
        
        controller.videoGravity = .resizeAspectFill
        
        // repeating playback.....
        player.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.restartPlayback), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject{
        
        var parent: CustomVideoPlayer
        
        init(parent: CustomVideoPlayer) {
            self.parent = parent
        }
        
        @objc func restartPlayback(){
            parent.player.seek(to: .zero)
        }
    }
}
