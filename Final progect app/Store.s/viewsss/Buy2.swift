//
//  Buy2.swift
//  Store.s
//
//  Created by Sedra Asrawi on 28/08/2022.
//

import SwiftUI

struct Buy2: View {
    
//    @Binding var prodName : String
    @State var products : [DetailsModel]
//    @Binding var products : [UIImage]
    @State var showBuyProdDetails = false
    @State var productBuyDetails : DetailsModel
    @State var basketarray : [DetailsModel] = []

    @State var shopDet : shopModel
//    @State var addToBag  : Image = Image.init(systemName: "plus")
    @State var addToBag = "plus.circle.fill"
    @State var addtobagcol = Color("Color2")
    @State var sidelinecol = Color.clear


    
    let colums :[GridItem] = [
        GridItem(.fixed(150), spacing: 30, alignment: nil),
        GridItem(.fixed(150), spacing: 30, alignment: nil)
    ]
    
    
    
    @State var quantity : Int = 0

    func Total () -> Double {
       return
        (Double(quantity) * (Double(productBuyDetails.prodPrice) ?? 0))
    }
    
//    @State var addtobasketText = "Add To Basket For"
    @State var quanColor = Color.clear
    @State var numquanColor = Color.clear



    
    var body: some View {
//        NavigationView {
            VStack{
                VStack{
                    ScrollView {
                        
                        Image(uiImage: shopDet.shopLogo)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 390, height: 300)
                            .clipped()
                            .ignoresSafeArea()
                            .shadow(color: .gray, radius: 20)
                        
                        HStack{
                            Text("\(shopDet.shopName)")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                        }.padding(.horizontal)

                        Divider()
                                          
                                   ForEach(products, id: \.self){
                                            product in
                                           
                           HStack{
                              
                                   VStack{
                                           Text(product.prodName)
                                               .font(.headline)
                                               .fontWeight(.bold)
                                               .padding(.horizontal)
                                           .foregroundColor(.black)
                                           
                                        
                                           Text(product.prodDet)
                                               .font(.caption)
                                               .fontWeight(.medium)
                                               .foregroundColor(.black)
                                           .padding(5)
                                           
                                           
                                           HStack{
                                               Text(product.prodPrice)
                                                   .font(.headline)
                                                   .fontWeight(.semibold)
                                                   .foregroundColor(.black)
                                               
                                               Text("KD")
                                                   .font(.headline)
                                                   .fontWeight(.semibold)
                                                   .foregroundColor(.black)
                                           }
                                           .padding(.horizontal)
                               }
                               
                               
                               Spacer()
                               
    //                           VStack
                               
                               Image(uiImage: product.prodImage)
                                       .resizable()
                                       .scaledToFill()
                                   .frame(width: 110, height:110)
                                   .clipped()
                                   .cornerRadius(5)
//                                   .frame(width: 110, height:130)
                               .shadow(color: .gray.opacity(0.3), radius: 10)
                               .padding(.horizontal)
                               .overlay(
                                
                                Button(action: {
                                    basketarray.insert(product, at: 0)
                                    quantity += 1
                                    if quantity >= 1 {
                                        quanColor = Color("Color2")
                                        numquanColor = Color.black
                                    }
                                    else if quantity == 0 {
                                        quanColor = Color.clear
                                        numquanColor = Color.clear
                                    }
                                }, label: {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(Color("Color2"))
                                        .padding()
                                        .frame(width: 20, height: 20)
                                        .background(Circle()
                                            .fill(.white)
                                        ).padding(8)
                                        .padding(.horizontal)

                                })
                                        , alignment: .topTrailing)
                               
                              
                      } .overlay(
                        Image("line")
                            .resizable()
                            .frame(width: 70, height: 160)
                            .foregroundColor(sidelinecol)
                            .offset(x: -33)
                        , alignment: .leading)
                                   }
                        .accentColor(Color("Color4"))
                    }.ignoresSafeArea()

                    
                    Spacer()
                    
                       
                    
                     
                }
//                .navigationTitle("\(shopDet.shopName)")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                      
                        NavigationLink {
                            
                            Basket(basketArray: basketarray, ProductsDetails: productBuyDetails)
                            
                        } label: {
                            Image.init(systemName: "bag.fill") 
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .overlay( Text(String(quantity))
                                    .font(.caption)
                                    .foregroundColor(numquanColor)
                                          
                                    .background(Circle()
                                        .fill(quanColor)
                                        .frame(width: 20, height: 20)
                                             )
                                    
                                         
                                         , alignment: .topTrailing)
                        }


                    }

                    
                }
            }
//        }
    }
}

struct Buy2_Previews: PreviewProvider {
    static var previews: some View {
        Buy2(products: [DetailsModel(prodName: "hehe", prodDet: "hehehe", prodPrice: "3", prodImage: UIImage(named: "Ananas")!, plus: "", line: "")],
             
             
             productBuyDetails: DetailsModel(prodName: "name", prodDet: "det", prodPrice: "5", prodImage: UIImage(named: "Ananas")!, plus: "", line: ""), basketarray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")], shopDet: shopModel(shopName: "shop name", shopLogo: UIImage(named: "Ananas")!, shoptype: ""))
    }
}
