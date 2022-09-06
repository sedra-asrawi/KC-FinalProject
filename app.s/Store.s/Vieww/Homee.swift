//
//  Home.swift
//  Store.s
//
//  Created by Sedra Asrawi on 02/09/2022.
//

import SwiftUI

struct Homee: View {
    @Binding var selectedTab: String
//    @Binding var username : String
    

    //    init(selectedTab: Binding<String>) {
//        self._selectedTab = selectedTab
//        UITabBar.appearance().isHidden = true
//    }
    @State var username2 : String
    @State var foodstoreArray : [shopModel] = []
    @Binding var shopDet : shopModel

    @State var giftsstoresArray : [shopModel] = []
    @State var clothesstoresArray : [shopModel] = []
    @State var technostoresArray : [shopModel] = []
    @State var otherstoresArray : [shopModel] = []
    
    @Binding var productsArray : [DetailsModel]

    @State var basketArray : [DetailsModel]
    
    @State var ProductsDetails : DetailsModel
    
    @Binding var username : String
    
    var body: some View {
        
//        NavigationView {
            
            ZStack{

                TabView(selection: $selectedTab){
                    

                    
//                    Homey(username2: "", shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")), productsArray: .constant([]), basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())])
                    
               Home(username: $username, foodstoresArray: foodstoreArray, giftsstoresArray: giftsstoresArray, clothesstoresArray: clothesstoresArray, technostoresArray: technostoresArray, otherstoresArray: otherstoresArray,shopsDet: $shopDet, productsArray: $productsArray, basketArray: $basketArray)
                        .tag("Home")
                    
                    Favorites()
                        .tag("Favorites")
                    
                    ReelsHome()
                        .tag("Reels")
                    
                    Messeges(ToName: "")
                        .tag("Messages")
                    
                    BusinessAcademy()
                        .tag("Business Academy")
                   
                }
               
                
            }
            
//        }
        

    }
}

struct Homee_Previews: PreviewProvider {
    static var previews: some View {
        Homee(selectedTab: .constant(""),username2: ""
              ,
              shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
              , productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")])
              
              , basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]
              , ProductsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()), username: .constant("hi")
        )
    }
}



struct HomeePage: View {
    
    var body: some View{
        
        NavigationView{
            
            VStack(alignment: .leading,spacing: 20){
            
                Image("Ananas")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width - 50, height: 400)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Jenna Ezarik")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("iJustine's Sister, YoutTuber ,Techie....")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                })
            }
            .navigationTitle("Home")
        }
    }
}

struct History: View {
    
    var body: some View{
        
        NavigationView{
            
            Text("History")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("History")
        }
    }
}

struct Notificationss: View {
    
    var body: some View{
        
        NavigationView{
            
            Text("Notifications")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Notifications")
        }
    }
}

struct Settings: View {
    
    var body: some View{
        
        NavigationView{
            
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Settings")
        }
    }
}

struct Help: View {
    
    var body: some View{
        
        NavigationView{
            
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Help")
        }
    }
}
