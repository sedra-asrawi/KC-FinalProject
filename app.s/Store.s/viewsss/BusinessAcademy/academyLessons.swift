//
//  academyLessons.swift
//  Store.s
//
//  Created by Sedra Asrawi on 04/09/2022.
//

import SwiftUI

struct academyLessons: View {
    var body: some View {
        ZStack{
            Color("Color2").opacity(0.4)
                .ignoresSafeArea()
            VStack{

                Text("Wanna Take a Business course ?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .underline()
                    .padding()
                    .frame(width: 390)
                    .padding(.top,200)
Spacer()
                NavigationLink {
                    calenHome()
                } label: {
                    Text("See courses schedule")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Color1"))
                        .padding()
                        .padding(.horizontal)
                        .background(Color("Color2"))
                        .padding(.top,100)
                        .cornerRadius(10)
                        .shadow(color: Color("Color2"), radius: 10)
                }

                Image("business3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding(.top,50)
Spacer()
                
            }
        }
    }
}

struct academyLessons_Previews: PreviewProvider {
    static var previews: some View {
        academyLessons()
    }
}
