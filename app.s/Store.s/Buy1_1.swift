////
////  Buy1.1.swift
////  Store.s
////
////  Created by Sedra Asrawi on 27/08/2022.
////
//
//import SwiftUI
//
//struct Buy1_1: View {
//    
//    @State var types = ["food","gifts","clothes","technology","other"]
//
//    
//    var body: some View {
//        ZStack{
//            
//            Image("5")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 390, height: 910)
//            
//            VStack{
//                
//                ZStack {
//                    Rectangle()
//                      .fill(.clear)
//                  .frame(width: 390, height: 200)
//            }
//                
//                ScrollView{
//                    
//                    ForEach(types, id: \.self) { type in
//                        
//                        ZStack{
//                            
//                           VStack{
//                                Image(type)
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 330, height: 160)
//                                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                                    .blur(radius: 2)
//                                    .overlay(Color.black.opacity(0.5))
//                                    .cornerRadius(15)
//                                    .padding()
//                                                
//                                    }
//                            
//                                      Text(type)
//                                         .font(.title)
//                                         .fontWeight(.medium)
//                                         .foregroundColor(.white)
//                            
//                            
//                                                                }
//                        
//                    }
//                    
//                }
//                
//                
//            }
//            
//            
//        }
//    }
//}
//
//struct Buy1_1_Previews: PreviewProvider {
//    static var previews: some View {
//        Buy1_1()
//    }
//}
