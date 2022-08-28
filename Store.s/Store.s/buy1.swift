////
////  buy1.swift
////  Store.s
////
////  Created by Sedra Asrawi on 27/08/2022.
////
//
//import SwiftUI
//
//struct buy1: View {
//    
//    @State var types = ["food","gifts","clothes","technology","other"]
//   
//    var body: some View {
//        
//        VStack {
//            Spacer()
//                ScrollView{
//
//                VStack{
//                    Spacer()
//                    ZStack {
//                        Rectangle()
//                          .fill(.clear)
//                          .frame(width: 390, height: 50)
//                        
//                        VStack {
//                            HStack {
//                                Text("We Guess It's Shopping Time !")
//                                    .font(.system(size:24))
//                                    .fontWeight(.bold)
//                                Spacer()
//                            }
//                            Spacer()
//                            HStack {
//                                Text("What do you like to buy ?")
//                                    .font(.headline)
//                                Spacer()
//
//                            }
//
//                        }.frame(height: 80)
//                        .padding()
//                        
//                        
//                    }
//                                ForEach(types, id: \.self) {
//                                    type in
//
//                                    ZStack {
//                                        VStack{
//                                                Image(type)
//                                                    .resizable()
//                                                    .scaledToFill()
//                                                    .frame(width: 330, height: 160)
//                                                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                                                .blur(radius: 2)
//                                                .overlay(Color.black.opacity(0.5))
//                                                .cornerRadius(15)
//                                                .padding()
//
//                                            Spacer()
//
//
//
//
//
//                                        }
//
//                                        Text(type)
//                                            .font(.title)
//                                            .fontWeight(.medium)
//                                            .foregroundColor(.white)
//
//
//                                    }
//
//                                }
//
//
//                }.frame(height: 850,alignment: .center)
//
//                }.background(Image("5")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 390, height: 900))
//        }
//            
//        
//        
//    }
//}
//
//struct buy1_Previews: PreviewProvider {
//    static var previews: some View {
//        buy1()
//    }
//}
