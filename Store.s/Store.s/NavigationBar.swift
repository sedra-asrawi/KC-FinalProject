//
//  NavigationBar.swift
//  store.s
//
//  Created by Sedra Asrawi on 23/08/2022.
//

import SwiftUI

struct NavigationBar: View {
    
    
    @State var selectedTab = 2
    @State var selction : String = "home"
    @State var username2 : String
    @Binding var storeName : [UIImage]
    @Binding var shopsName : String



    

    
    var body: some View {
        
            TabView(selection: $selectedTab) {
                
                Color.red
                    .ignoresSafeArea(edges: .top)
                    .tabItem {
                        Image(systemName: "message")
                    }
                    .tag(1)
                
                
                Home(username: $username2, thestoreName: $storeName, shopsName: $shopsName)
                    .ignoresSafeArea(edges: .top)
                    .tabItem {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .tag(2)

                
                PersonalPage()
                    .ignoresSafeArea(edges: .top)
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                    }
                    .tag(3)

            }
            .background(.white)
            .accentColor(Color("Color4"))
        
        
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(username2: "", storeName: .constant([UIImage(named: "Ananas")!]), shopsName: .constant("Ananas"))
    }
}
