//
//  LinkPreview.swift
//  Store.s
//
//  Created by Sedra Asrawi on 05/09/2022.
//

import SwiftUI
import LinkPresentation

struct LinkPreview: UIViewRepresentable {
    
    var metaData: LPLinkMetadata
    
    func makeUIView(context: Context) -> LPLinkView {
        
        let preview = LPLinkView(metadata: metaData)
        
        return preview
    }
    
    func updateUIView(_ uiView: LPLinkView, context: Context) {
        
        uiView.metadata = metaData
    }
}
