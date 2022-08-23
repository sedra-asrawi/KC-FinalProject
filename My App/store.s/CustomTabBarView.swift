//
//  CustomTabBarView.swift
//  store.s
//
//  Created by Sedra Asrawi on 23/08/2022.
//

import SwiftUI

struct CustomTabBarView: View {

    let tabs: [TabBarItem]
    @Binding var selection : TabBarItem

    var body: some View {

            HStack{
                ForEach(tabs, id: \.self){
                    tab in
                    Spacer()
                    tabView(tab: tab)
                    Spacer()

                }
           }.padding(6)
            .frame(width: 390, height: 40)
            .background(.white)
            .ignoresSafeArea(edges: .bottom)
            .shadow(color: .gray.opacity(0.4), radius: 30)

    }
}

struct CustomTabBarView_Previews: PreviewProvider {

//    @State var selection : TabBarItem

    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "line.3.horizontal.circle.fill", iconColor: Color("Color2")),
        TabBarItem(iconName: "house", iconColor: Color("Color3")),
        TabBarItem(iconName: "person.circle.fill", iconColor: Color("Color4"))

    ]

    static var previews: some View {

        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))

        }
    }
}


private func tabView(tab: TabBarItem) -> some View {

    VStack {
        Image(systemName: tab.iconName)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .foregroundColor(selection == tab ? tab.iconColor : Color.gray)



    }.padding(.top,25)

}

private func switchtotab(tab: TabBarItem) {
    withAnimation(.easeInOut) {
        selection = tab
    }
}


struct TabBarItem: Hashable {
    let iconName: String
    let iconColor: Color

}
