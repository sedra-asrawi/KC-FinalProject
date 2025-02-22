//
//  IntroScreen.swift
//  Store.s
//
//  Created by Sedra Asrawi on 05/09/2022.
//

import SwiftUI

struct IntroScreen: View {
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        
        ZStack{
            
            DotInversion(currentIndex: $currentIndex)
                .ignoresSafeArea()
            
            // Indicators...
            HStack(spacing: 10){
                
                ForEach(tabs.indices,id: \.self){index in
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                        .opacity(currentIndex == index ? 1 : 0.3)
                        .scaleEffect(currentIndex == index ? 1.1 : 0.8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding(25)
            
            // Skip Button..
            Button("Skip"){
                
            }
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        }
        .preferredColorScheme(.dark)
    }
}

struct IntroScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreen()
    }
}
