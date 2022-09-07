//
//  Message.swift
//  Store.s
//
//  Created by Sedra Asrawi on 05/09/2022.
//

import SwiftUI
import LinkPresentation

struct Message: Identifiable {
    var id = UUID().uuidString

    var messageString: String
    var date: Date = Date()


    var previewLoading: Bool = false

    var linkMetaData: LPLinkMetadata?

    var linkURL: URL?
}
