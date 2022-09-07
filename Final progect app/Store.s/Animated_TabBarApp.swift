//
//  Animated_TabBarApp.swift
//  Shared
//
//  Created by Balaji on 17/12/20.
//

import SwiftUI

@main
struct Animated_TabBarApp: App {
    var body: some Scene {
        WindowGroup {
            customTabBar(username2: "", shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
                         , productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())]), basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())]
           )
        }
    }
}
