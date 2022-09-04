//
//  academyGames.swift
//  Store.s
//
//  Created by Sedra Asrawi on 04/09/2022.
//

import SwiftUI

struct academyGames: View {
    
    let games = ["quiz","tictactoe"]
    var body: some View {
        ZStack{
//            ScrollView{
            Color("Color4").opacity(0.4)
                .ignoresSafeArea()
            VStack {
                
                Text("What Would You Like To Play ?")
                    .font(.title)
                    .fontWeight(.medium)
                    .frame(width: 380)
                    .padding()
                
                NavigationLink {
                    quiezGame()
                } label: {
                    VStack {
                        HStack{
                            Image("quiz")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(7)
                                .background(.white)
                                .cornerRadius(5)
                            Text("quiz")
                                .font(.headline)
                                .padding(.horizontal)
                        }.padding()
                            .frame(width: 300, alignment: .leading)
                            .background(Color("Color1"))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.5), radius: 5)
                    }.padding()
                }

                
                VStack {
                    HStack{
                        Image("tictactoe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(7)
                            .background(.white)
                            .cornerRadius(5)
                        Text("tictactoe")
                            .font(.headline)
                            .padding(.horizontal)
                    }.padding()
                        .frame(width: 300, alignment: .leading)
                        .background(Color("Color1"))
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5)
                }.padding()
                
            }
//            }
        }
    }
}

struct academyGames_Previews: PreviewProvider {
    static var previews: some View {
        academyGames()
    }
}
