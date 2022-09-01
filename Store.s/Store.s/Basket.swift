//
//  Basket.swift
//  Store.s
//
//  Created by Sedra Asrawi on 30/08/2022.
//

import SwiftUI

struct Basket: View {
    
    @State var basketArray : [DetailsModel] = []
    @State var ProductsDetails : DetailsModel
    
    
    var body: some View {
//        NavigationView {
            ZStack{
                    
                    Color.gray.opacity(0.1).ignoresSafeArea()
                    VStack{
                       
                        HStack {
                          
                            
                            NavigationLink {
                                
                                Buy1(shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")), productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())]), basketArray: $basketArray)
                                
    
                                
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 22))
                                    .padding(.horizontal)
                                    .foregroundColor(.black)
                            }


                            Spacer()

                            Text("Shopping Basket")
                                .font(.title3)
                            .fontWeight(.bold)
                            
                            Spacer()
                            
                            
                            Image(systemName: "checklist")
                                .font(.system(size: 20))
                                .foregroundColor(Color("Color4"))
                            
                            Image(systemName: "heart")
                                .font(.system(size: 20))
                                .foregroundColor(Color("Color2"))

                            
                            
                        }.padding()
                        .frame(width: 390)
                        .background((Color.white).ignoresSafeArea(edges: .top))
                        
                        
                        ScrollView{
                            List{
                                ForEach(basketArray, id: \.self) {
                                    item in
                                    
                                    NavigationLink {
                                        Buy3(ProdictsDetails: ProductsDetails, ProdictsDetailsArray: $basketArray, basketArray: $basketArray)
                                    } label: {
                                        HStack{
                                            Image(uiImage: item.prodImage)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 100, height: 100)
                                                .cornerRadius(10)
                                                .clipped()
                                            
                                            Text(item.prodName)
                                                .font(.headline)
                                            Spacer()
                                            
                                            Text(item.prodPrice)
                                            
                                            
                                        }

                                    }

                                }
                            }
                            
                        }
                        
                        
                        Spacer()
                    }
                }
                
            .navigationBarHidden(true)
            
//        }
        
    }
}

struct Basket_Previews: PreviewProvider {
    static var previews: some View {
        Basket(ProductsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
    }
}
