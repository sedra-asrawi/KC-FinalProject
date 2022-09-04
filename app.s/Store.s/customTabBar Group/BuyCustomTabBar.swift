////
////  ddd.swift
////  Store.s
////
////  Created by Sedra Asrawi on 02/09/2022.
////
//
//import SwiftUI
//
//struct customTabBar: View {
//    
//    @State var foodstoreArray : [shopModel] = []
//    @State var shopDet : shopModel
//    @State var giftsstoresArray : [shopModel] = []
//    @State var clothesstoresArray : [shopModel] = []
//    @State var technostoresArray : [shopModel] = []
//    @State var otherstoresArray : [shopModel] = []
//    @State var productsArray : [DetailsModel] = []
//    @State var basketArray : [DetailsModel] = []
//    
//    var body: some View {
//
//        Homey()
//    }
//}
//
//struct customTabBar_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        customTabBar(shopDet: shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
//    }
//}
//
//struct Homey: View {
//    
//    @State var foodstoreArray : [shopModel] = []
//    @State var shopDet : shopModel
//    @State var giftsstoresArray : [shopModel] = []
//    @State var clothesstoresArray : [shopModel] = []
//    @State var technostoresArray : [shopModel] = []
//    @State var otherstoresArray : [shopModel] = []
//    @State var productsArray : [DetailsModel] = []
//    @State var basketArray : [DetailsModel] = []
//    @State var selectedtab = "food-1"
//    
//    init() {
//
//        UITabBar.appearance().isHidden = true
//    }
//    
//   
//    
//    // Location For each Curve...
//    @State var xAxis: CGFloat = 0
//    
//    @Namespace var animation
//    
//    var body: some View{
//        
//        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
//            TabView(selection: $selectedtab){
//                
//                FoodBuy(shopsName: .constant(""), shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")), productsArray: .constant([]), basketArray: .constant([]))
//                    .ignoresSafeArea(.all, edges: .all)
//                    .tag("food-1")
//                
////                FoodBuy(shopsName: .constant(""), shopDet: $shopDet, productsArray: $productsArray, basketArray: $basketArray)
////                    .ignoresSafeArea(.all, edges: .all)
////                    .tag("food-1")
//                
//                GiftsBuy(shopsName: .constant(""), shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")), productsArray: .constant([]), basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())])
//                    .ignoresSafeArea(.all, edges: .all)
//                    .tag("box")
//                
//                ClothesBuy(shopsName: .constant(""), shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")), productsArray: .constant([]), basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())])
//                    .ignoresSafeArea(.all, edges: .all)
//                    .tag("clothes-1")
//                
//                TechnologyBuy(shopsName: .constant(""), shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")), productsArray: .constant([]), basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())])
//                    .ignoresSafeArea(.all, edges: .all)
//                    .tag("techno")
//                
//                OtherBuy(shopsName: .constant(""), shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: "")), productsArray: .constant([]), basketArray: [DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())])
//                    .ignoresSafeArea(.all, edges: .all)
//                    .tag("other-1")
//            }.frame(height: 800)
//            
//            // Custom tab Bar...
//            
//            HStack(spacing: 0){
//                
//                ForEach(tabs,id: \.self){image in
//                    
//                    GeometryReader {reader in
//                        Button(action: {
//                            withAnimation(.spring()){
//                                selectedtab = image
//                                xAxis = reader.frame(in: .global).minX
//                            }
//                        }, label: {
//                            
//                            Image(image)
//                                .resizable()
//                                .renderingMode(.template)
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 25, height: 25)
//                                .foregroundColor(selectedtab == image ? getColor(image: image) : Color(.gray).opacity(0.6))
//                                .padding(selectedtab == image ? 15 : 0)
//                                .background(Color("Color3").opacity(selectedtab == image ? 1 : 0).clipShape(Circle()))
//                                .matchedGeometryEffect(id: image, in: animation)
//                                .offset(x: selectedtab == image ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX) : 0,y: selectedtab == image ? -50 : 0)
//                            
//                        })
//                        .onAppear(perform: {
//                            
//                            if image == tabs.first{
//                                xAxis = reader.frame(in: .global).minX
//                            }
//                        })
//                    }
//                    .frame(width: 25, height: 30)
//                    
//                    if image != tabs.last{Spacer(minLength: 0)}
//                }
//            }
//            .padding(.horizontal,30)
//            .padding(.vertical)
//            .background(Color("Color3").clipShape(CustomShape(xAxis: xAxis)).cornerRadius(12))
//            .padding(.horizontal)
//            // Bottom Edge...
//            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
////            .padding()
//        }
//        .ignoresSafeArea(.all, edges: .bottom)
//    }
//    
//    // getting Image Color....
//    
//    func getColor(image: String)->Color{
//        
//        switch image {
//        case "food-1":
//            return Color.white
//        case "box":
//            return Color.white
//        case "clothes-1":
//            return Color.white
//        case "techno":
//            return Color.white
//        default:
//            return Color.white
//        }
//    }
//}
//
//var tabs = ["food-1","box","clothes-1","techno","other-1"]
//
//// Curve...
//
//struct CustomShape: Shape {
//    
//    var xAxis: CGFloat
//    
//    // Animating Path...
//    
//    var animatableData: CGFloat{
//        get{return xAxis}
//        set{xAxis = newValue}
//    }
//    
//    func path(in rect: CGRect) -> Path {
//        
//        return Path{path in
//            
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
//            path.addLine(to: CGPoint(x: 0, y: rect.height))
//            
//            let center = xAxis
//            
//            path.move(to: CGPoint(x: center - 50, y: 0))
//            
//            let to1 = CGPoint(x: center, y: 35)
//            let control1 = CGPoint(x: center - 25, y: 0)
//            let control2 = CGPoint(x: center - 25, y: 35)
//            
//            let to2 = CGPoint(x: center + 50, y: 0)
//            let control3 = CGPoint(x: center + 25, y: 35)
//            let control4 = CGPoint(x: center + 25, y: 0)
//            
//            path.addCurve(to: to1, control1: control1, control2: control2)
//            path.addCurve(to: to2, control1: control3, control2: control4)
//        }
//    }
//}
