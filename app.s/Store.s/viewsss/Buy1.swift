//
//  Buy1.1.swift
//  Store.s
//
//  Created by Sedra Asrawi on 27/08/2022.
//

import SwiftUI

struct Buy1: View {

    @State var types = ["food","gifts","clothes","technology","other"]
    @State var foodstoresArray : [shopModel] = []
    @Binding var shopDet : shopModel

    @State var giftsstoresArray : [shopModel] = []
    @State var clothesstoresArray : [shopModel] = []
    @State var technostoresArray : [shopModel] = []
    @State var otherstoresArray : [shopModel] = []
    
    @Binding var productsArray : [DetailsModel]
    
    @Binding var basketArray : [DetailsModel]

    var body: some View {
//        NavigationView {
        
            ZStack{

                Image("5")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                

                VStack{

                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                          .fill(.clear)
                      .frame(width: 390, height: 240)
                        
                        VStack {
                             HStack {
                         Text("It's Shopping Time !")
                                     .font(.system(size:24))
                                     .fontWeight(.bold)
                                Spacer()
                                 
//                                 NavigationLink {
//
//
//                                 } label: {
//                                     Image(systemName: "bag.fill")
//                                         .foregroundColor(Color("Color4"))
//                                         .font(.system(size: 35))
//                                         .frame(alignment: .bottomTrailing)
//                                         .overlay(Circle()
//                                            .fill(Color("Color3"))
//                                            .frame(width: 15, height: 15)
//                                                  , alignment: .bottomTrailing)
//                                 }

                                 
                            }
                                Spacer()
                         HStack {
                                Text("What Would you like to buy ?")
                                    .font(.headline)
                                Spacer()
                       
                }
                            }.frame(height: 80)
                            .padding(.top,70)
                            .padding(.horizontal)
                        
                    }.padding(.top,50)

                    ScrollView{

                            NavigationLink {
                                
                                FoodBuy(foodshopsArray: foodstoresArray, shopsName: .constant(""),shopDet: $shopDet, productsArray: $productsArray, basketArray: $basketArray)
                                        
                            } label: {
                                ZStack{

                                   VStack{
                                       Image("food")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 330, height: 160)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .blur(radius: 2)
                                            .overlay(Color.black.opacity(0.5))
                                            .cornerRadius(15)
                                            .padding()
                                            .shadow(color: Color.gray.opacity(0.7), radius: 9)

                                            }

                                              Text("food")
                                                 .font(.title)
                                                 .fontWeight(.medium)
                                                 .foregroundColor(.white)


                                                                        }
                            }
                            
                            NavigationLink {
                                
                                GiftsBuy(giftsshopsArray: giftsstoresArray, shopsName: .constant(""),shopDet: $shopDet, productsArray: $productsArray, basketArray: basketArray)
                                
                            } label: {
                                ZStack{

                                   VStack{
                                        Image("gifts")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 330, height: 160)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .blur(radius: 2)
                                            .overlay(Color.black.opacity(0.5))
                                            .cornerRadius(15)
                                            .padding()
                                            .shadow(color: Color.gray.opacity(0.7), radius: 9)

                                            }

                                              Text("gifts")
                                                 .font(.title)
                                                 .fontWeight(.medium)
                                                 .foregroundColor(.white)


                                                                        }
                            }
                            
                            NavigationLink {
                                
                                ClothesBuy(clothesshopsArray: clothesstoresArray, shopsName: .constant(""),shopDet: $shopDet, productsArray: $productsArray, basketArray: basketArray)
                                
                            } label: {
                                ZStack{

                                   VStack{
                                        Image("clothes")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 330, height: 160)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .blur(radius: 2)
                                            .overlay(Color.black.opacity(0.5))
                                            .cornerRadius(15)
                                            .padding()
                                            .shadow(color: Color.gray.opacity(0.7), radius: 9)

                                            }

                                              Text("clothes")
                                                 .font(.title)
                                                 .fontWeight(.medium)
                                                 .foregroundColor(.white)


                                                                        }
                            }
                            
                            NavigationLink {
                                
                                TechnologyBuy(technoshopsArray: technostoresArray, shopsName: .constant(""),shopDet: $shopDet, productsArray: $productsArray, basketArray: basketArray)
                                
                            } label: {
                                ZStack{

                                   VStack{
                                        Image("technology")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 330, height: 160)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .blur(radius: 2)
                                            .overlay(Color.black.opacity(0.5))
                                            .cornerRadius(15)
                                            .padding()
                                            .shadow(color: Color.gray.opacity(0.7), radius: 9)

                                            }

                                              Text("technology")
                                                 .font(.title)
                                                 .fontWeight(.medium)
                                                 .foregroundColor(.white)


                                                                        }
                            }
                            
                            NavigationLink {
                                
                                OtherBuy(othershopsArray: otherstoresArray, shopsName: .constant(""),shopDet: $shopDet, productsArray: $productsArray, basketArray: basketArray)
                                
                            } label: {
                                ZStack{

                                   VStack{
                                        Image("other")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 330, height: 160)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                            .blur(radius: 2)
                                            .overlay(Color.black.opacity(0.5))
                                            .cornerRadius(15)
                                            .padding()
                                            .shadow(color: Color.gray.opacity(0.7), radius: 9)

                                            }

                                              Text("other")
                                                 .font(.title)
                                                 .fontWeight(.medium)
                                                 .foregroundColor(.white)


                                                                        }
                            }
                            
                            


                        
                        
                    }.padding(.bottom,100)


                }


            }
//        }
    }
}

struct Buy1_1_Previews: PreviewProvider {
    static var previews: some View {
        Buy1(shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")),productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]), basketArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")])
        )
    }
}
