//
//  Basket.swift
//  Store.s
//
//  Created by Sedra Asrawi on 30/08/2022.
//

import SwiftUI

struct Basket: View {
    
    @State var basketArray : [DetailsModel]
    @State var ProductsDetails : DetailsModel
    
    
    var body: some View {
//        NavigationView {
            ZStack{
                    
                    Color.gray.opacity(0.1).ignoresSafeArea()
                    VStack{
                       
                        Text("Shopping Bag")
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding()
                        
                        
//                        HStack {
//
//
//                            NavigationLink {
//
//                                Home(username: .constant(""), foodstoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")], giftsstoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")], clothesstoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")], technostoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")], otherstoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")], shopsDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")), productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())]), basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())])
//
//
//
//                            } label: {
//                                Image(systemName: "xmark")
//                                    .font(.system(size: 22))
//                                    .padding(.horizontal)
//                                    .foregroundColor(.black)
//                            }
//
//
//                            Spacer()
//
//                            Text("Shopping Basket")
//                                .font(.title3)
//                            .fontWeight(.bold)
//
//                            Spacer()
//
//
//                            Image(systemName: "checklist")
//                                .font(.system(size: 20))
//                                .foregroundColor(Color("Color4"))
//
//                            Image(systemName: "heart")
//                                .font(.system(size: 20))
//                                .foregroundColor(Color("Color2"))
//
//
//
//                        }.padding()
//                        .frame(width: 390)
//                        .background((Color.white).ignoresSafeArea(edges: .top))
                        
                        
//                        ScrollView{
                            List{
                                ForEach(basketArray, id: \.self) {
                                    item in
                                    
                                        HStack{
                                            Image(uiImage: item.prodImage)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 90, height: 90)
                                                .cornerRadius(10)
                                                .clipped()
                                                .padding(5)
                                            
                                            Text(item.prodName)
                                                .font(.headline)
                                            Spacer()
                                            
                                            Text(item.prodPrice)
                                            
                                            
                                        }

                                    

                                }
                                .onDelete { IndexSet in
                                    basketArray.remove(atOffsets: IndexSet) }
                            }
                            
//                        }
                        
                        
                        Spacer()
                    }
                }
                
            
//        }
        
    }
}

struct Basket_Previews: PreviewProvider {
    static var previews: some View {
       
        Basket(
       
            
            basketArray: [], ProductsDetails: (DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")))
    }
}
