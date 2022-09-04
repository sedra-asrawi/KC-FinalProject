//
//  Buy2.swift
//  Store.s
//
//  Created by Sedra Asrawi on 28/08/2022.
//

import SwiftUI

struct Buy2: View {
    
//    @Binding var prodName : String
    @State var products : [DetailsModel] = []
//    @Binding var products : [UIImage]
    @State var showBuyProdDetails = false
    @State var productBuyDetails : DetailsModel
    @State var basketarray : [DetailsModel] = []

    @State var shopDet : shopModel

    
    let colums :[GridItem] = [
        GridItem(.fixed(150), spacing: 30, alignment: nil),
        GridItem(.fixed(150), spacing: 30, alignment: nil)
    ]
    
    
    
    var body: some View {
//        NavigationView {
            VStack{
                       List {
          
                           ForEach(products, id: \.self){
                                    product in
                               
                               
                               
                               
                               NavigationLink {
                                   Buy3(ProdictsDetails: product, ProdictsDetailsArray: $products, basketArray: basketarray)
                               } label: {
                                   
                   HStack{
                      
                      Image(uiImage: product.prodImage)
                              .resizable()
                              .scaledToFill()
                          .frame(width: 110, height:110)
                          .clipped()
                          .cornerRadius(5)
                          .frame(width: 110, height:130)
                      .shadow(color: .gray.opacity(0.3), radius: 10)

                       
                       
                       VStack{
                           Text(product.prodName)
                               .font(.headline)
                               .fontWeight(.thin)
                               .padding()
                               .foregroundColor(.black)

                           
                           
                           
                               Spacer()
                           
                               HStack{
                                   Text(product.prodPrice)
                                       .font(.headline)
                                       .fontWeight(.semibold)
                                       .foregroundColor(.black)
                                   
                                   Text("KD")
                                       .font(.headline)
                                       .fontWeight(.semibold)
                                       .foregroundColor(.black)
                               }.padding()
                       }
                      
              }
                               }.accentColor(.white)

                               
//                              .sheet(isPresented: $showBuyProdDetails) {
//                                  Buy3(ProdictsDetails: $productBuyDetails, ProdictsDetailsArray: $products)
//                                    }
                               
                           }
//                           .onTapGesture {
//                               showBuyProdDetails = true
//                           }
//                          
                    }.accentColor(Color("Color4"))

                
                Spacer()
                
                   
                
                 
            }
            .navigationTitle("\(shopDet.shopName)")
//        }
    }
}

struct Buy2_Previews: PreviewProvider {
    static var previews: some View {
        Buy2(productBuyDetails: DetailsModel(prodName: "name", prodDet: "det", prodPrice: "5", prodImage: UIImage(named: "Ananas")!), basketarray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())], shopDet: shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
    }
}
