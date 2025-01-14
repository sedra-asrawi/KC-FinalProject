//
//  SideMenu.swift
//  Store.s
//
//  Created by Sedra Asrawi on 02/09/2022.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
    @Binding var username : String
    @State var profilepic : UIImage
    @State private var showSheet = false


    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            
            Button {
                showSheet = true
            } label: {
                Image(uiImage: profilepic)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)

                    .padding(.top,50)
            }

            
            VStack(alignment: .leading, spacing: 6, content: {
                
                Text(username)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
               
            })
            

            VStack(alignment: .leading,spacing: 10){
                
                TabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "heart", title: "Favorites", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "play", title: "Reels", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "message", title: "Messages", selectedTab: $selectedTab, animation: animation)
                
                
                
                TabButton(image: "book", title: "Business Academy", selectedTab: $selectedTab, animation: animation)
                
               
                
            }
            .padding(.leading,-15)
            .padding(.top,50)
            
            Spacer()
            

            VStack(alignment: .leading, spacing: 6, content: {
                
                
                
                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log out", selectedTab: .constant(""), animation: animation)
                    .padding(.leading,-15)
                
                Text("App Version 1.2.34")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
            })
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
        .navigationBarHidden(true)
        
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$profilepic)
    }

    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(selectedTab: .constant(""), username: .constant("Name"), profilepic: UIImage(named: "profilepic")!)
    }
}
