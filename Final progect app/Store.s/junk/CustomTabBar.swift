////
////  CustomTabBar.swift
////  store.s
////
////  Created by Sedra Asrawi on 23/08/2022.
////
//
//import SwiftUI
//
//struct CustomTabBar: View {
//    
//    let taps : [TabBarItem]
//    
//    var body: some View {
//       
//    }
//}
//
//struct CustomTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabBar()
//    }
//}
//
//extension CustomTabBarView {
//    func tabView() -> some View{
//        
//        
//        ZStack {
//            Rectangle()
//                .frame(width: 390, height: 100)
//                .foregroundColor(.white)
//                .shadow(color: .gray.opacity(0.2), radius: 30, x: 0, y: 0)
//            
//            
//                Spacer()
//            Image(systemName: tab.iconName)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(tap.color)
//                        .padding(.bottom,33)
//              Spacer()
//        }.padding(.top,700)
//    }
//}
//
//struct TabBarItem : Hashable {
//    let iconName: String
//    let color : Color
//}
//
//
////Spacer()
////
////    Image("Home")
////        .resizable()
////        .scaledToFit()
////        .frame(width: 30, height: 30)
////        .padding(.bottom,33)
////
////
////Spacer()
////
////    Image(systemName: "person.circle.fill")
////        .resizable()
////        .scaledToFit()
////        .frame(width: 30, height: 30)
////        .foregroundColor(Color("Color4"))
////        .padding(.bottom,33)
