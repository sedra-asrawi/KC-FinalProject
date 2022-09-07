//
//  DateValue.swift
//  Store.s
//
//  Created by Sedra Asrawi on 04/09/2022.
//

import SwiftUI

// Date Value Model...
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
