//
//  calenHome.swift
//  Store.s
//
//  Created by Sedra Asrawi on 04/09/2022.
//

import SwiftUI

struct calenHome: View {
    
    @State var currentDate: Date = Date()
    @State var showalert = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20){
                
                // Custom Date Picker....
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        // Safe Area View...
        .safeAreaInset(edge: .bottom) {
            
            HStack{
                
                Button {
                    
                    showalert = true
                    
                } label: {
                    HStack {
                        Text("Join course Meeting")
                            .fontWeight(.bold)
                            .padding(.vertical)
                        
                        Image(systemName: "video.fill")
                    }.frame(maxWidth: .infinity)
                    .background(Color("Color4"),in: Capsule())
                        
                }
            }
            .padding(.horizontal)
            .padding(.top,10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
        .alert(isPresented: $showalert) {
            Alert(title: Text("early time?"),
                  message: Text("Meeting date didn't arraive yet"), dismissButton: .cancel()) }
        
    }
}

struct calenHome_Previews: PreviewProvider {
    static var previews: some View {
        calenHome()
    }
}
