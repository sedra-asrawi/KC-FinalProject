//
//  startView.swift
//  Store.s
//
//  Created by Sedra Asrawi on 05/09/2022.
//

import SwiftUI

struct startView: View {
    
    @State var isAnimating = false
    
     var animation : Animation {
        
        .interpolatingSpring(stiffness: 0.5, damping: 0.5)
            .repeatForever()
            .delay(isAnimating ? .random(in: 0...1) : 0 )
            .speed(isAnimating ? .random(in: 0.1...1) : 0 )
        
    }
    
    
    var body: some View {
        GeometryReader { proxy in
            VStack{
                ZStack{
                    ForEach(1 ..< 14) { i in
                        
                        Image("app\(i % 10 )")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .opacity(0.7)
                            .position(x: .random(in: 0...proxy.size.width),
                                      y: .random(in: 0...proxy.size.height / 2)
                            )
                            .animation(animation)
                        
                    }
                    
                }.frame(height: proxy.size.height / 3)
                
                VStack{
                    Text("Store.s")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Unlimited shopping, selling, and learning!")
                        .font(.headline)
                        .fontWeight(.thin)

                        .frame(width: 330)
                }
                .padding()
                .background(Color("Color1"))
                .cornerRadius(10)
                .shadow(color: Color("Color1"), radius: 10)
                
                Spacer()
                
                NavigationLink {
                    
                    logein()
                    
                } label: {
                    Text("Let's Start")
                        .padding()
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(width: 250, height: 60)
                        .background(Color("Color4"))
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.5), radius: 10)
                    
                }
                Spacer()

            }.background(Color("Coloe2"))
            .onAppear {
                isAnimating.toggle()
            }
            
            
        }
    }
}

struct startView_Previews: PreviewProvider {
    static var previews: some View {
        startView()
    }
}
