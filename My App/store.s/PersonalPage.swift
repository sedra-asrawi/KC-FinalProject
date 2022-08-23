//
//  PersonalPage.swift
//  store.s
//
//  Created by Sedra Asrawi on 23/08/2022.
//

import SwiftUI

struct PersonalPage: View {
    var body: some View {
        NavigationView {
            ZStack{
                    Image("2")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
            }
        }
    }
}

struct PersonalPage_Previews: PreviewProvider {
    static var previews: some View {
        PersonalPage()
    }
}
