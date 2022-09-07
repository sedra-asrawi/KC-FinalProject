//
//  Reel.swift
//  Store.s
//
//  Created by Sedra Asrawi on 06/09/2022.
//

import SwiftUI
import AVKit

struct Reel: Identifiable {

    var id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile
}
