//
//  Tab.swift
//  Store.s
//
//  Created by Sedra Asrawi on 05/09/2022.
//

import SwiftUI

// Tab Model and sample Intro Tabs....
struct Tab: Identifiable{
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var description: String
    var image: String
    var color: Color
}

// Add more tabs for more intro screens....
  var tabs: [Tab] = [

    Tab(title: "Shop !", subTitle: "from different Businesses", description: "unlimited shopping from your favorite businesses and great deals !", image: "6",color: Color("Color1")),
    
    Tab(title: "Run Your Business", subTitle: "like a master 😎", description: "communicate with your customers and share products with them.", image: "7",color: Color("Color3").opacity(0.3)),
    
    Tab(title: "Learn", subTitle: "and make your business grow", description: "learn how to be a master in business through our Business Academy, learn and have fun !", image: "8",color: Color("Color3"))
]
