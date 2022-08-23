//
//  Home.swift
//  store.s
//
//  Created by Sedra Asrawi on 22/08/2022.
//

import SwiftUI

struct Home: View {
    @State var username = ""
    @State var password = ""
    @State var iconback : Color = .clear
    @State var homeiconback : Color = .gray
    @State var selction : String = "home"
    
    
    
    var body: some View {
        NavigationView {
            
            
            ZStack{
                Image("1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack{
                    
                    HStack {
                        Text("Good Morning ☀️")
                            .font(.system(size: 30))
                        .fontWeight(.heavy)
                        Spacer()
                    }.frame(width: 350)
                    
                    HStack {
                        Text("\(username)")
                            .font(.title)
                            .fontWeight(.ultraLight)
                        Spacer()
                    }.frame(width: 350)
                    
                    Spacer()
                    
                }.frame(width: 390, height: 600)
                
                VStack {
                    Spacer()
                    HStack{
                        VStack {
                            Image("buy")
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .frame(width: 170, height: 170)
                                .background(.white)
                                .cornerRadius(20)
                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                            
                            Text("BUY")
                                .fontWeight(.bold)
                                .padding(5)
                        }
                        
                        
                        VStack {
                            Image("sell")
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .frame(width: 170, height: 170)
                                .background(.white)
                                .cornerRadius(20)
                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                            
                            Text("SELL")
                                .fontWeight(.bold)
                                .padding(5)
                        }
                        
                        
                    }
                    
                    
                    Spacer()
                }.padding(.bottom,90)
                
                
               
                
                
                
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
