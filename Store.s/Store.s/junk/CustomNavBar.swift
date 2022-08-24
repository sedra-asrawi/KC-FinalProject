//
//  CustomNavBar.swift
//  store.s
//
//  Created by Sedra Asrawi on 23/08/2022.
//

import SwiftUI

struct CustomNavBar: View {
    @State var username = ""
    @State var password = ""
    @State var iconback : Color = .clear
    @State var homeiconback : Color = .gray
    var body: some View {
        NavigationView{
            ZStack {
                Rectangle()
                    .frame(width: 390, height: 100)
                    .foregroundColor(.white)
                    .shadow(color: .gray.opacity(0.2), radius: 30, x: 0, y: 0)
                
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("Color2"))
                            .background(
                                Circle()
                                    .shadow(color: .gray, radius: 90)
                                    .foregroundColor(iconback.opacity(0.1))
                                    .frame(width: 50, height: 50)
                                    
                            )
                            .padding(.bottom,33)
                            
                    }
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Image("Home")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .background(
                                Circle()
                                    .shadow(color: .gray, radius: 90)
                                    .foregroundColor(homeiconback.opacity(0.1))
                                    .frame(width: 50, height: 50)
                                    
                            )
                            .padding(.bottom,33)
                            
                    }
                    Spacer()
                    
                    NavigationLink {
                        PersonalPage()
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("Color4"))
                            .background(
                                Circle()
                                    .shadow(color: .gray, radius: 90)
                                    .foregroundColor(iconback.opacity(0.1))
                                    .frame(width: 50, height: 50)
                                    
                            )
                            .padding(.bottom,33)
                            
                    }
                    
                    
                  Spacer()
                    
                }
                
            }.padding(.top,700)
        }
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar()
    }
}
