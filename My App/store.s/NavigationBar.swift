//
//  NavigationBar.swift
//  store.s
//
//  Created by Sedra Asrawi on 23/08/2022.
//

import SwiftUI

struct NavigationBar: View {
    @State var selection = ""
    var body: some View {
        TabView(selection: $selection) {
            Color.red
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "house")
                        .foregroundColor(Color("Color3"))
                }
            Color.blue
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "house")
                }
            Color.yellow
                .ignoresSafeArea(edges: .top)
                .tabItem {
                    Image(systemName: "house")
                }
        }
        .background(.white)
            
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
