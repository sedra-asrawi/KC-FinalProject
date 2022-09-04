//
//  ClothesBuy.swift
//  Store.s
//
//  Created by Sedra Asrawi on 29/08/2022.
//

import SwiftUI

struct ClothesBuy: View {
    
    let colors = [Color.white,Color("Color3")]
    @State var clothesshopsArray : [shopModel] = []
    @Binding var shopsName : String
    @State var flashSale = ["red","white"]
    let popular = ["rositowarag3enab","TheBakery","Velvet.kwt","Cloudyy.Cakes"]
    @Binding var shopDet : shopModel

    @Binding var productsArray : [DetailsModel]
    
    @State var basketArray : [DetailsModel]

    
    var body: some View {
//                NavigationView{
        ZStack {
            VStack {
                
                HStack{
                    
                    Image(systemName: "bicycle.circle.fill")
                        .foregroundColor(Color("Color4"))
                        .font(.system(size: 40))
                    
                    VStack {
                        Text("Delivery Address :")
                            .fontWeight(.light)
                        HStack {
                            Text("Home")
                                .fontWeight(.bold)
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color("Color4"))
                                .font(.system(size: 15))

                            Spacer()
                        }.frame(width: 134)

                    }
                    
                    Spacer()
                    
                    Image(systemName: "heart.circle")
                        .foregroundColor(Color("Color2"))
                        .font(.system(size: 30))
                    
                    
                }.padding()
                
                HStack {
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        Text("dishes, businesses, restaurants")
                            .foregroundColor(.gray)
                        
                        Spacer()

                    }.padding(10)
                    .background(.gray.opacity(0.2))
                    .frame(width: 320)
                .cornerRadius(5)
                    
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(Color("Color4"))
                        .font(.system(size: 25))
                }
                
                
                Divider()
                    .padding(.top,20)
                ZStack{
        //                        RadialGradient(gradient: Gradient(colors: colors),
        //                                       center: .topLeading,
        //                                       startRadius: 1,
        //                                       endRadius: 960)
                                ScrollView{

                                    HStack {
                                        Text("Shops :")
    //                                        .foregroundColor(Color("Color4"))
                                            .font(.system(size: 25))
                                            .fontWeight(.semibold)
                                            .shadow(color:Color("Color4"), radius: 1)
                                            .padding()
                                        Spacer()
                                    }
                                    ScrollView(.horizontal){
                                        
                                        HStack {
                                            ForEach(clothesshopsArray, id: \.self){
                                                shop in
                                                
                                                NavigationLink {
                                                    
                                                    Buy2(products: productsArray, productBuyDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: ""), shopDet: shopDet)
                                                    
                                                } label: {
                                                    HStack{
                                                        VStack{
                                                            Image(uiImage: shop.shopLogo)
                                                                .resizable()
                                                                .scaledToFill()
                                                                .clipShape(Rectangle())
                                                                .frame(width: 250, height: 170)
                                                                .clipped()
                                                                .cornerRadius(5)
                                                                .shadow(color:.gray, radius: 6)

                                                                
                                                            Text(shop.shopName)
                                                                .font(.headline)
                                                                .foregroundColor(.black)
                                                                        
                                                        }.padding()
                                                    }
                                                }


                                            }
                                        }
                                        
                                    }
                                    
                                    Divider()
                                    
                                    HStack {
                                        Spacer()
                                        Text("Flash Sales !")
                                            .foregroundColor(Color("Color4"))
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .shadow(color:Color("Color2"), radius: 1)
                                            .padding()
                                        Spacer()
                                    }
                                    
                                    ScrollView(.horizontal) {
                                        HStack{
                                            
                                            ForEach(flashSale, id: \.self){
                                                sale in
                                                
                                                VStack{
                                                    Image(sale)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .clipShape(Rectangle())
                                                        .frame(width: 130, height: 130)
                                                        .clipped()
                                                        .cornerRadius(20)
                                                        .padding()
                                                    
                                                    Text(sale)
                                                        .font(.headline)
                                                    

                                                }.padding(3)
                                                
                                            }
                                            
                                        }
                                       
                                    }
                                    .frame(width: 350,height: 220)
                                    .background(
                                        Color("Color4").opacity(0.3))
                                    .cornerRadius(13)
                                    .shadow(color: .gray.opacity(0.5), radius: 15)
                                    
                                    Divider()
                                    
                                    HStack {
                                        Text("POPULAR :")
                                            .font(.system(size: 25))
                                            .fontWeight(.semibold)
                                            .shadow(color:Color("Color4"), radius: 1)
                                        .padding()
                                        Spacer()
                                    }
                                    
                                    ScrollView(.horizontal){
                                        
                                        HStack {
                                            ForEach(popular, id: \.self){
                                                popularStore in
                                                HStack{
                                                    VStack{
                                                        Image(popularStore)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .clipShape(Rectangle())
                                                            .frame(width: 250, height: 170)
                                                            .clipped()
                                                            .cornerRadius(5)
                                                            .shadow(color:.gray.opacity(0.2), radius: 10)

                                                            
                                                        Text(popularStore)
                                                            .font(.headline)
                                                                    
                                                    }.padding()
                                                    
                                                    
                                                }
                                                
                                            }
                                        }
                                        
                                    }
                                    
                                }.background(.gray.opacity(0.045))
                }
                
    //                                            .navigationTitle(Text("Food Shopping"))

            }
            .navigationBarBackButtonHidden(false)
            .padding(.top,75)
        .edgesIgnoringSafeArea(.top)
            
            LinearGradient(colors: [(Color.white)],
                           startPoint: .bottom,
                           endPoint: .top)
            .blur(radius: 100)
            .frame(width: 390, height: 60)
            .padding(.top,790)
        }
        
                


//                }
    }
}

struct ClothesBuy_Previews: PreviewProvider {
    static var previews: some View {
        ClothesBuy(shopsName: .constant("Ananas"), shopDet: .constant(shopModel(shopName: "Ananas", shopLogo: UIImage(named: "Ananas")!, shoptype: "")), productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]), basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]
        )
    }
}
