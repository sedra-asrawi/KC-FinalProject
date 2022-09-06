//
//  MainView.swift
//  Store.s
//
//  Created by Sedra Asrawi on 02/09/2022.
//

import SwiftUI

struct MainView: View {
    // selected Tab...
    @State var selectedTab = "Home"
    @State var showMenu = false
    @Binding var username : String
    @State var foodstoreArray : [shopModel] = []
    @Binding var shopDet : shopModel

    @State var giftsstoresArray : [shopModel] = []
    @State var clothesstoresArray : [shopModel] = []
    @State var technostoresArray : [shopModel] = []
    @State var otherstoresArray : [shopModel] = []
    
    @Binding var productsArray : [DetailsModel]

    @State var basketArray : [DetailsModel]
    
    @State var ProductsDetails : DetailsModel

    
    var body: some View {
       
//        NavigationView {
            ZStack{
                    
                    Color("Color3")
                        .ignoresSafeArea()
                    

                ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                        
                        SideMenu(selectedTab: $selectedTab, username: $username)
                    })

                    ZStack{
                        

                        
                        Color.white
                            .opacity(0.5)
                            .cornerRadius(showMenu ? 15 : 0)

                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                            .offset(x: showMenu ? -25 : 0)
                            .padding(.vertical,30)
                        
                        Color.white
                            .opacity(0.4)
                            .cornerRadius(showMenu ? 15 : 0)

                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                            .offset(x: showMenu ? -50 : 0)
                            .padding(.vertical,60)
                        
                        Homee(selectedTab: $selectedTab, username2: "", foodstoreArray: foodstoreArray, shopDet: $shopDet, giftsstoresArray: giftsstoresArray, clothesstoresArray: clothesstoresArray, technostoresArray: technostoresArray, otherstoresArray: otherstoresArray, productsArray: $productsArray, basketArray: basketArray, ProductsDetails: ProductsDetails, username: $username)
                        
                            .cornerRadius(showMenu ? 15 : 0)
                            .disabled(showMenu ? true : false)
                    }
                    

                    .scaleEffect(showMenu ? 0.84 : 1)
                    .offset(x: showMenu ? getRect().width - 120 : 0)
                    .ignoresSafeArea()
                    .overlay(
                    

                        VStack{
                            
                            Button(action: {
                                withAnimation(.spring()){
                                    showMenu.toggle()
                                }
                            }, label: {
                                

                                VStack(spacing: 5){
                                    
                                    Capsule()
                                        .fill(showMenu ? Color.white : Color.primary)
                                        .frame(width: 30, height: 3)

                                        .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                                        .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)

                                    VStack(spacing: 5){
                                        
                                        Capsule()
                                            .fill(showMenu ? Color.white : Color.primary)
                                            .frame(width: 30, height: 3)

                                        Capsule()
                                            .fill(showMenu ? Color.white : Color.primary)
                                            .frame(width: 30, height: 3)
                                            .offset(y: showMenu ? -8 : 0)
                                    }
                                    .rotationEffect(.init(degrees: showMenu ? 50 : 0))
                                }
                                .contentShape(Rectangle())
                            })
                            .padding()
                            
                        }

                        
                        
                        ,alignment: .topTrailing
                        
                    )
                    
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)


                }
//        }
            
//        }
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(username: .constant("hi"), shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
                 , productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]), basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")], ProductsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
    }
}


extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

