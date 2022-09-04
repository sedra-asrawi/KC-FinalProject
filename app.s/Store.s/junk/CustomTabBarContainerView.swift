////
////  CustomTabBarContainerView.swift
////  store.s
////
////  Created by Sedra Asrawi on 23/08/2022.
////
//
//import SwiftUI
//
//
//struct CustomTabBarContainerView<Content:View>: View {
//    
//    @Binding var selection : TabBarItem
//    let contant : Content
//    @State var tabs : [TabBarItem] = []
//    
//    init(selection: Binding<TabBarItem>?, @ViewBuilder content: () -> Content) {
//        self._selection = selection
//        self.contant = content()
//    }
//    
//    var body: some View {
//        ZStack{
//            content
//        }
//        CustomTabBarView(tabs: <#T##[TabBarItem]#>, selection: $selection)
//    }
//}
//
//struct CustomTabBarContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabBarContainerView()
//    }
//}
