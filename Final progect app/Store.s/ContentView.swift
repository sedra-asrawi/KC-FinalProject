//
//  ContentView.swift
//  store.s
//
//  Created by Sedra Asrawi on 22/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     
        NavigationView {
            walkThrough()
            
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            
        }.accentColor(Color("Color4"))
        
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)

        
        
        
        
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
