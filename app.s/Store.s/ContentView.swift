//
//  ContentView.swift
//  store.s
//
//  Created by Sedra Asrawi on 22/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var username : String = ""
    @State var password = ""
    @State var iconback : Color = .clear
    @State var homeiconback : Color = .gray
    @State var isShowingImagePicker = false
    @State private var image = UIImage()
    @State private var showSheet = false
    
   
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .padding(.top,100)
                        .padding(.bottom,20)
                    .frame(width: 400, height: 210)
                    
                    HStack {
                        Text("Welcome !")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(5)
                        Spacer()
                        
                    }.frame(width: 350)
                        
                    HStack {
                        Text("Sign in to start your journy ")
                            .font(.title)
                            .padding(5)
                        
                        Spacer()
                    }.frame(width: 350)
                    
                    Spacer()
                    
                    TextField("User Name", text: $username)
                        .foregroundColor(Color("Color4"))
                        .padding()
                        .background(.white)
                        .cornerRadius(7)
                        .frame(width: 330, height: 70)
                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                    
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(Color("Color4"))
                        .padding()
                        .background(.white)
                        .cornerRadius(7)
                        .frame(width: 330, height: 70)
                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                    
                    
                    NavigationLink {
                        
                        MainView(username: $username, shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
                                 , productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]), basketArray: [], ProductsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
                            .navigationBarHidden(true)

                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Let's Start")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .padding()
                            .foregroundColor(.black)
                            .frame(width: 330, height: 70)
                            .background(Color("Color3"))
                            .cornerRadius(7)
                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 1, y: 1)
                            .padding()
                    }

                 
                    Text("Forget your password ?")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .underline()
                    
                    Spacer()
                }
                
                
            }
//            .navigationBarHidden(true)
            
        }.accentColor(Color("Color4"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            
    }
}

