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
    
    @State var ProdictsDetails : DetailsModel
    @Binding var shopDet : shopModel
    
    func productsNum () -> Int {
        posts.count
        
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
                                
                                Buy2(prodName: $ProdictsDetails.prodName, productDet: $ProdictsDetails, products: $posts)
                                
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
                                
                                if publishColor == Color("Color2"){
                                    foodstoresArray.insert(shopDet, at: 0)
     //                                publishText = "Your Store is out !"
                                     publishImage = "megaphone.fill"
                                     publishColor = Color("Color4")
                                }
                                else {
                                    
                                    foodstoresArray.removeAll()
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
                                post = UIImage(named: "white")!

                                
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
                            
                            ForEach(posts, id: \.self) { post in
                                Image(uiImage: post)
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

                    
                    
                    
                    
                }.frame(width: 390, height: 700)
                
                
                NavigationLink {
                    NavigationBar(username2: "Sedra", foodstoreArray: $foodstoresArray, shopsName: $StoreName, shopDet: $shopDet)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Image("Home")
                        .resizable()
                        .scaledToFit()
                    
                        .frame(width: 40, height: 40)
                        .padding(.top,640)
                       
                        
                }
                
                    .sheet(isPresented: $showSheet) {
                            ImagePicker(sourceType: .photoLibrary, selectedImage:
//                                            self.
                                        $post)
                        
                    }
          
                    .sheet(isPresented: $GoToDetails) {
                        Product_Details(post: $post, posts: $posts, ProdictsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: post))
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
        Sell2_1(image: .constant(UIImage(named: "white")!), StoreName: .constant("store name"), foodstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]), ProdictsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()), shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")))
    }
}
