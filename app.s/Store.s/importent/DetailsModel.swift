//
//  DetailsModel.swift
//  Store.s
//
//  Created by Sedra Asrawi on 28/08/2022.
//

import Foundation
import UIKit
import SwiftUI

struct DetailsModel : Hashable {
    
    var id = UUID()
    var prodName : String
    var prodDet : String
    var prodPrice : String
    var prodImage : UIImage
    var plus : String = "plus.circle.fill"  
    var line : String = "checkmark.circle.fill"
    var isAddedToBag : Bool = false
    
    
    
}


    
    
    

