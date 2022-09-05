//
//  Home.swift
//  store.s
//
//  Created by Sedra Asrawi on 22/08/2022.
//

import SwiftUI

struct Home: View {
    
    @Binding var username : String
    
    @State var foodstoresArray : [shopModel] = []
    @State var giftsstoresArray : [shopModel] = []
    @State var clothesstoresArray : [shopModel] = []
    @State var technostoresArray : [shopModel] = []
    @State var otherstoresArray : [shopModel] = []
    
    @Binding var shopsDet : shopModel

    @Binding var productsArray : [DetailsModel]
    
    @Binding var basketArray : [DetailsModel]
    


    var body: some View {
            
            ZStack{
                    Image("1")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                
                VStack {
                    
//                        HStack{
//                            Image(systemName: "line.3.horizontal.circle")
//                                .resizable()
//                                .scaledToFit()
//                                .foregroundColor(Color("Color3"))
//                                .frame(width: 30, height: 30)
//                                .shadow(color: .gray, radius: 5)
//                                .offset(y: -54)
//                            Spacer()
//                        }.padding(.horizontal)
                    

                    
                    
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
                                        .foregroundColor(Color("Color5"))
                                    Spacer()
                                }.frame(width: 350)
                                
                           
                            Spacer()
                            
                    }.frame(width: 390, height: 600)
                }
                    
                    VStack {
                        Spacer()
                        HStack{
                        
                            NavigationLink {
                                
                                Buy1(foodstoresArray: foodstoresArray, shopDet: $shopsDet, giftsstoresArray: giftsstoresArray, clothesstoresArray: clothesstoresArray, technostoresArray: technostoresArray, otherstoresArray: otherstoresArray, productsArray: $productsArray, basketArray: $basketArray)
                               
                                
                            } label: {
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
                            }

                            
                            
                            
                                NavigationLink{
                                    
                                    if shopsDet.shopName == "" {
                                    
                                        Sell1(username: $username,
                                              shopDet: shopsDet, foodstoresArray: foodstoresArray, giftsstoresArray: giftsstoresArray, clothesstoresArray: clothesstoresArray, technostoresArray: technostoresArray, otherstoresArray: otherstoresArray, basketArray: basketArray)}
                                    
                                    
                                    else {
                                        
                                        Sell2_1(username: $username, image: .constant(UIImage()), StoreName: .constant(""), foodstoresArray: $foodstoresArray, giftsstoresArray: $giftsstoresArray, clothesstoresArray: $clothesstoresArray, technostoresArray: $technostoresArray, otherstoresArray: $otherstoresArray, ProductDet: .constant(DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")), shopDet: $shopsDet, basketArray: basketArray)
                                        
                                    }
                                    
                                    
                                } label: {
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

                                
                                    
                            
                            
                            
                        }
                        
                        
                        Spacer()
                    }.padding(.bottom,90)
                    
                    
                   
                    
                    .navigationBarHidden(true)

                    
            }
       
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(username: .constant("name")
             ,shopsDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")), productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]), basketArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]))
    }
}
