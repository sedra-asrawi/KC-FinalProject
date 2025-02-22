//
//  Sell1.swift
//  store.s
//
//  Created by Sedra Asrawi on 22/08/2022.
//

import SwiftUI

struct Sell1: View {
    
    @Binding var username : String
    @State var password = ""
    @State var iconback : Color = .clear
    @State var StoreName = ""
    @State var StoreType = ""
    @State var types = ["food","gifts","clothes","technology","other"]
    @State var selectedNumber: Int = 0
    @State var logo = UIImage(named: "white")!
    @State var isShowingImagePicker = false
    @State private var image = UIImage(named: "white")!
    @State private var showSheet = false
    
    @State var shopDet : shopModel

    
    @State var foodstoresArray : [shopModel]
    @State var giftsstoresArray : [shopModel]
    @State var clothesstoresArray : [shopModel]
    @State var technostoresArray : [shopModel]
    @State var otherstoresArray : [shopModel]
  
    @State var basketArray : [DetailsModel]

    
    var body: some View {
        
            ZStack {
                    Color.gray.opacity(0.1)
                        .ignoresSafeArea()
                    ZStack {
                            VStack {
                                
                                
                                HStack {
                                    Text("Start Your Business !")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(5)
                                    Spacer()
                                    
                                }.frame(width: 350)
                                    
                                HStack {
                                    VStack{
                                        HStack {
                                            Text("Let's Make Your Store ,")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Shall We ?")
                                            Spacer()
                                        }
                                    } .font(.title)
                                      .padding(5)
                                    
                                    Spacer()
                                }.frame(width: 350)
                                
                                Spacer()
                                
                                TextField("Store Name", text: $shopDet.shopName)
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(7)
                                    .frame(width: 330, height: 70)
                                    .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                                
                                
                                
                                Menu("Choose Store's Speciality") {
                                    Picker("Please choose a color", selection: $shopDet.shoptype)
                                        {
                                            ForEach(types, id: \.self) {
                                                Text($0)
                                            }
                                        }
                                        
                                    }
                                         .foregroundColor(Color("Color4"))
                                         .padding()
                                         .frame(width: 330, height: 55)
                                         .background(.white)
                                         .cornerRadius(7)
                                             .padding()
                                
                                
                                HStack {
                                    Text("your store is specialized in : ")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("Color2"))
                                    
                                    Text("\(shopDet.shoptype)")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Color2"))
                                    
                                }
                                
                                
                                Button {
                                    
                                    showSheet = true
                                    
                                }
                            
                            label: {
                                    Text("Choose Store's Logo")
                                        .fontWeight(.light)
                                        .foregroundColor(.black)
                                        .padding()
                                        .frame(width: 330, height: 55)
                                        .background(.white)
                                        .cornerRadius(7)
                                        .padding()
                            }
                                
                                Image(uiImage: self.shopDet.shopLogo)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 70, height: 70)
                                    .shadow(color: .gray.opacity(0.4), radius: 10)
                                

                                NavigationLink {
                                     
                                    Sell2_1(username: $username, image: $image,
                                            StoreName: .constant(""),
                                            foodstoresArray: $foodstoresArray,
                                            giftsstoresArray: $giftsstoresArray,
                                            clothesstoresArray: $clothesstoresArray,
                                            technostoresArray: $technostoresArray,
                                            otherstoresArray: $otherstoresArray,
                                            ProductDet: .constant(DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(named: "white")!, plus: "", line: "")),
                                            shopDet: .constant(shopModel(shopName: shopDet.shopName, shopLogo: shopDet.shopLogo, shoptype: shopDet.shoptype)), basketArray: basketArray
                                            )
//                                            Sell2_1(image: $image, StoreName: .constant(""), foodstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]), giftsstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]), clothesstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]), technostoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]), otherstoresArray: .constant([shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")]), ProdictsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()), shopDet: .constant(shopModel(shopName: shopDet.shopName, shopLogo: shopDet.shopLogo, shoptype: shopDet.shoptype))
//
//                                            )
                                            
                                    
                                        .navigationBarBackButtonHidden(true)
//
                                } label: {
                                    Text("Let's Start")
                                        .font(.system(size: 20))
                                        .fontWeight(.medium)
                                        .padding()
                                        .foregroundColor(.black)
                                        .frame(width: 330, height: 70)
                                        .background(Color("Color3"))
                                        .cornerRadius(7)
                                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                                        .padding()
//                                        
                                        
                                        }
                                Spacer()
                                }
                                
                                
                                
                                
                                
                               }
                        .padding(.bottom,50)
                        .sheet(isPresented: $showSheet) {
                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$shopDet.shopLogo)
                    }
                
                
         
                
            }
           
       
        
            
     

        
        
        }

    


    


struct Sell1_Previews: PreviewProvider {
    static var previews: some View {
        Sell1(username: .constant("sed"),
              
              StoreName: "", shopDet: shopModel(shopName: "", shopLogo: UIImage(named: "white")!, shoptype: ""),
              
              foodstoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")],
              
              giftsstoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")],
              
              clothesstoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")],
              
              technostoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")],
              
              otherstoresArray: [shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")],
              basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]
        )
    }
}
}



