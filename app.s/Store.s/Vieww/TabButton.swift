//
//  TabButton.swift
//  Store.s
//
//  Created by Sedra Asrawi on 02/09/2022.
//

import SwiftUI

struct TabButton: View {
    var image: String
    var title: String
    
    // Selected Tab...
    @Binding var selectedTab: String
    // For Hero Animation Slide...
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()){selectedTab = title}
        }, label: {
            
            HStack(spacing : 15){
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                    
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? Color("Color2") : .white)
            .padding(.vertical,12)
            .padding(.horizontal,10)
            // Max Frame..
            .frame(maxWidth: getRect().width - 170, alignment: .leading)
            .background(
            
                // hero Animation...
                ZStack{
                    
                    if selectedTab == title{
                        Color.white
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorners(corners: [.topRight,.bottomRight], radius: 12))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            )
        })
        
        .navigationBarHidden(true)

    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
