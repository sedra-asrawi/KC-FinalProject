//
//  signUp.swift
//  Store.s
//
//  Created by Sedra Asrawi on 07/09/2022.
//

import SwiftUI
import FirebaseAuth

struct signup: View {
    
    
    @State var username : String = ""
    @State var password = ""
    @State var email = ""
    @State var iconback : Color = .clear
    @State var homeiconback : Color = .gray
    @State var isShowingImagePicker = false
    @State private var image = UIImage()
    @State private var showSheet = false
    @State var error = ""
    
    @State var go = false
    @State var showalert = false
    
    @State var password2 = ""

    @EnvironmentObject var viewModel : AppViewModel
    
    
    var body: some View {
        
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            Color("Color3")
                .clipShape(Circle())
                .offset(x: 200, y: -500)
            
            Color("Color3")
                .clipShape(Circle())
                .offset(x: -250, y: -370)
            
            Color("Color2")
                .clipShape(Circle())
                .offset(x: -30, y: -510)
            
            Color("Color2")
                .clipShape(Circle())
                .frame(width: 70, height: 70)
                .offset(x: -170, y: 370)
            
            Color("Color3")
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .offset(x: 150, y: 330)
            
            VStack {
                VStack {
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
                            Text("Sign up to start your journy ")
                                .font(.title)
                                .padding(5)
                            
                            Spacer()
                        }.frame(width: 350)
                        
                        Spacer()
                        
                        TextField("User Name", text: $username)
                            .disableAutocorrection(true)
                            .foregroundColor(Color("Color4"))
                            .padding()
                            .background(.white)
                            .cornerRadius(7)
                            .frame(width: 330, height: 70)
                            .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                        
                        TextField("E-mail", text: $email)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .foregroundColor(Color("Color4"))
                            .padding()
                            .background(.white)
                            .cornerRadius(7)
                            .frame(width: 330, height: 70)
                            .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                        
                        
                        SecureField("Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .foregroundColor(Color("Color4"))
                            .padding()
                            .background(.white)
                            .cornerRadius(7)
                            .frame(width: 330, height: 70)
                            .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                        
                        SecureField("Re inter Password", text: $password2)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .foregroundColor(Color("Color4"))
                            .padding()
                            .background(.white)
                            .cornerRadius(7)
                            .frame(width: 330, height: 70)
                            .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                        
                        
                        Button {
                            
                            guard !email .isEmpty, !password.isEmpty, password == password2  else {
                                return
                            }
                            if password != password2 {
                                error = "You Re Intered Your Password Incorrectly "
                            }
                            
                            viewModel.signup(email: email, password: password)
                            
                            
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
                        
                        NavigationLink(destination:  MainView(username: $username, shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
                                                              , productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]), basketArray: [], ProductsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
                                       
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                                       
                                       ,isActive: $go) {
                            EmptyView()
                        }
                        
                        
                        
                        
                        
                        
                    }
                    
                    Text(error)
                        .font(.headline)
                        .foregroundColor(.red)
                    
                }
                
                //                .alert(isPresented: $showalert) {
                //                    Alert(title: Text("Error"),
                //                          message: Text("Please fill in your details properly"),
                //                          dismissButton: .cancel(Text("Ok")))
                //            }
            
                Spacer()
                
                HStack {
                    Text("already have an account? ")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.top,70)
                    
                    NavigationLink {
                             signIn()
                        
                    } label: {
                        Text("Sign in")
                            .font(.system(size: 18))
                            .foregroundColor(Color("Color3"))
                            .fontWeight(.black)
                            .underline()
                            .padding(.top,65)
                    }
                    
                }

                
            }
            
        }
        .navigationBarHidden(true)
        
        //        }
        .accentColor(Color("Color4"))
        
    }
}

struct signup_Previews: PreviewProvider {
    static var previews: some View {
        signup()
    }
}
