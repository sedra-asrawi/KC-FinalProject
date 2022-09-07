//
//  Favorites.swift
//  Store.s
//
//  Created by Sedra Asrawi on 03/09/2022.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        ZStack {
            
            Color("Color1").opacity(0.7)
                .ignoresSafeArea()
            HStack {
                
                Image("soon")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width: 300, height: 300)
                
                    
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
