//
//  MediaFile.swift
//  Store.s
//
//  Created by Sedra Asrawi on 06/09/2022.
//

import SwiftUI


struct MediaFile: Identifiable{
    var id = UUID().uuidString
    var url: String
    var title: String
    var isExpanded: Bool = false
}

var MediaFileJSON = [
    
   MediaFile(url: "Reel1", title: "Packaging ✨"),
   MediaFile(url: "Reel2", title: "Orders through instagram"),
   MediaFile(url: "Reel3", title: "let me know what you like the best!"),
   MediaFile(url: "Reel4", title: "How many cups of coffee have you had today ?"),
   MediaFile(url: "Reel5", title: "How cute 🥹"),
   MediaFile(url: "Reel6", title: "The little mini cake 😍"),
   
]
