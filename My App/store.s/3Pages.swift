//
//  3Pages.swift
//  store.s
//
//  Created by Sedra Asrawi on 23/08/2022.
//

import SwiftUI

struct _Pages: View {
    
    @State var username = ""
    @State var password = ""
    @State var iconback : Color = .clear
    @State var homeiconback : Color = .gray
    @State var selection : String = "home"
    
    var body: some View {
        
        NavigationView {
            HStack {
                TabView(selection: $selection) {
                    Color.red
                        .tabItem {
                            Image(systemName: "house")
                            Text("home")
                        }
                    Color.blue
                        .tabItem {
                           Image("Home2")
                                .padding()
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30, height: 30)
//                                .background(
//                                    Circle()
//                                        .shadow(color: .gray, radius: 90)
//                                        .foregroundColor(homeiconback.opacity(0.1))
//                                        .frame(width: 50, height: 50))
//                                        .padding(.bottom,33)
                        }
                    Color.brown
                        .tabItem {
                            Image(systemName: "heart")
                            Text("fav")
                        }
                        
                }
            }
        }
    }
}

struct _Pages_Previews: PreviewProvider {
    static var previews: some View {
        _Pages()
    }
}
