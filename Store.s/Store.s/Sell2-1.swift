//
//  Sell2-1.swift
//  Store.s
//
//  Created by Sedra Asrawi on 28/08/2022.
//

import SwiftUI

struct Sell2_1: View {
    
    @Binding var image : UIImage
    @Binding var StoreName : String
    @State var publishText = "Publish My Store"
    @State var publishColor = Color("Color2")
    
    @Binding var foodstoresArray : [shopModel]
    @Binding var giftsstoresArray : [shopModel]
    @Binding var clothesstoresArray : [shopModel]
    @Binding var technostoresArray : [shopModel]
    @Binding var otherstoresArray : [shopModel]

    
    let colums :[GridItem] = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120))]
    
    @State var posts : [UIImage] = []
    @State private var post = UIImage(named: "white")!

    @State var GoToDetails = false
    @State var showSheet = false
    @State var closeDetails = false
    @State var publishImage = "megaphone"
    
    
    @Binding var ProductDet : DetailsModel
    
    @Binding var shopDet : shopModel

    @State var ProdictsArray : [DetailsModel] = []
    
    @State var basketArray : [DetailsModel]
    
    
    
    func productsNum () -> Int {
        ProdictsArray.count 
        
    }
    
    var body: some View {
//        NavigationView {
            ZStack{
                
                Image("5")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 420)
                
                VStack{
                    
                    HStack{
                        
                        Text(shopDet.shopName)
                            .font(.system(size: 25))
                        .fontWeight(.bold)
                        
                        
                        Spacer()
                        
                        
                        HStack{
                            
                            NavigationLink {
                                
                                Buy2(products: ProdictsArray, productBuyDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()), basketarray: $basketArray, shopDet: shopDet)
                                
                            } label: {
//                                Text("View My Store")
                                Image(systemName: "eye")
                                     .font(.system(size: 12))
                                     .padding(9)
                                     .background(Color("Color3"))
                                     .cornerRadius(5)
                                     .foregroundColor(.black)
                                     .shadow(color: .gray.opacity(0.3), radius: 10)
                            }
                            
                            Button {
                                
                                if publishColor == Color("Color2") && shopDet.shoptype == "food" {
                                    foodstoresArray.insert(shopDet, at: 0)
                                     publishImage = "megaphone.fill"
                                     publishColor = Color("Color4")
                                }
                                
                                else if publishColor == Color("Color2") && shopDet.shoptype == "gifts" {
                                    
                                    giftsstoresArray.insert(shopDet, at: 0)
                                     publishImage = "megaphone.fill"
                                     publishColor = Color("Color4")
                                    
                                }
                                
                                else if publishColor == Color("Color2") && shopDet.shoptype == "clothes" {
                                    
                                    clothesstoresArray.insert(shopDet, at: 0)
                                     publishImage = "megaphone.fill"
                                     publishColor = Color("Color4")
                                    
                                }
                                
                                else if publishColor == Color("Color2") && shopDet.shoptype == "technology" {
                                    
                                    technostoresArray.insert(shopDet, at: 0)
                                     publishImage = "megaphone.fill"
                                     publishColor = Color("Color4")
                                    
                                }
                                
                                else if publishColor == Color("Color2") && shopDet.shoptype == "other" {
                                    
                                    otherstoresArray.insert(shopDet, at: 0)
                                     publishImage = "megaphone.fill"
                                     publishColor = Color("Color4")
                                    
                                }
                                
                                else {
                                    
                                    otherstoresArray.removeAll()
     //                                publishText = "Your Store is out !"
                                     publishImage = "megaphone"
                                     publishColor = Color("Color2")
                                    
                                }

                                
                                
                            } label: {
                                
//                               Text(publishText)
                                Image(systemName: "\(publishImage)")
                                    .font(.system(size: 12))
                                    .padding(9)
                                    .background(publishColor)
                                    .cornerRadius(5)
                                    .foregroundColor(.black)
                                    .shadow(color: .gray.opacity(0.3), radius: 10)
                                
                            }
                            
                            Button {
                                GoToDetails = true
                                ProductDet.prodImage = UIImage(named: "white")!

                                
                            } label: {
//                               Text(publishText)
                                Image(systemName: "plus")
                                    .font(.system(size: 15))
                                    .padding(9)
                                    .background(Color("Color1"))
                                    .cornerRadius(5)
                                    .foregroundColor(.black)
                                    .shadow(color: .gray.opacity(0.3), radius: 10)
                            }
                            
                            
                        }

                        
                    }.frame(width: 360, height: 10)
                    .padding(.top,15)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .border(.gray.opacity(0.2))
                    .frame(width: 390, height: 10)
                    
                        
                        
               
                 
                        
                    
                    ScrollView {
                        
                        HStack {
                            Image(uiImage: shopDet.shopLogo)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 80, height: 80)
                            .shadow(color: .gray.opacity(0.4), radius: 10)
                            Spacer()
                            
                            VStack{
                                Text("Products")
                                    .font(.headline)
                                Text(String(productsNum()))
                                    .fontWeight(.thin)

                                
                            }
                            
                        }.padding()
                        .padding(.horizontal,30)
                       
                        
                        
                        
                        
                        Divider()
                        
                        LazyVGrid(columns: colums, spacing: 0) {
                            
                            ForEach(ProdictsArray, id: \.self) { post in
                                Image(uiImage: post.prodImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:120, height: 120)
                                    .border(.white)
                                    .clipped()
                                    .shadow(color: .gray.opacity(0.4), radius: 10)
                                    .onTapGesture {
                                     
                                       GoToDetails = true
                                 }
                                
                                
                                
                                
                                
                            }.padding(19)
                            
                        }.padding(.horizontal)
                    }.padding()
                    
                    Spacer()

                    
                    
                    
//                    Button {
//
////                        posts.append(post)
//                        GoToDetails = true
//
//                    } label: {
//                        Image(systemName: "plus")
//                        .foregroundColor(Color("Color2"))
//                        .font(.system(size: 35))
//                        .padding()
//                        .background(Circle()
//                            .fill(.white)
//                            .shadow(color: Color("Color2"), radius: 10)
//                        )
//                        .padding(.bottom,80)
//                    }

                    
                    
                    NavigationLink {
                        NavigationBar(username2: "Sedra",
                                      foodstoreArray: foodstoresArray,
                                      shopDet: $shopDet,
                                      giftsstoresArray: giftsstoresArray,
                                      clothesstoresArray: clothesstoresArray,
                                      technostoresArray: technostoresArray,
                                      otherstoresArray: otherstoresArray, productsArray: $ProdictsArray, basketArray: basketArray)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Image("Home")
                            .resizable()
                            .scaledToFit()
                        
                            .frame(width: 40, height: 40)
                            .padding()
                           
                            
                    }
                    
                }.frame(width: 390, height: 700)
                
                
              
                
                    .sheet(isPresented: $showSheet) {
                            ImagePicker(sourceType: .photoLibrary, selectedImage:
//                                            self.
                                        $ProductDet.prodImage)
                        
                    }
          
                    .sheet(isPresented: $GoToDetails) {
                        Product_Details(postsArray: $ProdictsArray, ProdictsDetails: ProductDet)
                    }
                
//                Image(uiImage: post)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100)
               
                    .navigationBarHidden(true)
            }
//            .navigationTitle("\(StoreName)")
//        }
    }
}

struct Sell2_1_Previews: PreviewProvider {
    
    
    static var previews: some View {
        Sell2_1(
            
            image: .constant(UIImage(named: "white")!),
            
                StoreName: .constant("store name"),
            
                foodstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]),
            
                giftsstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]),
            
                clothesstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]),
            
                technostoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]),
            
                otherstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]),
                
            ProductDet: .constant(DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(named: "white")!)),
                
            shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")),
            basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())]
                
            
        
        
        
        )
    }
}

//
//, giftsstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]), clothesstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]), technostoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]), otherstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")])
