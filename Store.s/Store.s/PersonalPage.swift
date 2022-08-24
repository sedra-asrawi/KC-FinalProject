//
//  PersonalPage.swift
//  store.s
//
//  Created by Sedra Asrawi on 23/08/2022.
//

import SwiftUI

struct PersonalPage: View {
    var body: some View {
            VStack {
                Spacer()
                ZStack{
                        Image("2")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                            .frame(width: 390, height: 300,alignment: .center)
                }.padding(.top,240)
                Spacer()
            }
    }
}

struct PersonalPage_Previews: PreviewProvider {
    static var previews: some View {
        PersonalPage()
    }
}
