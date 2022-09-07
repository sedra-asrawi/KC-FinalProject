////
////  ContentView.swift
////  store.s
////
////  Created by Sedra Asrawi on 22/08/2022.
////
//
//import SwiftUI
//import Firebase
//
//struct logein2: View {
//    
//    @State var username : String = ""
//    @State var password = ""
//    @State var email = ""
//    @State var iconback : Color = .clear
//    @State var homeiconback : Color = .gray
//    @State var isShowingImagePicker = false
//    @State private var image = UIImage()
//    @State private var showSheet = false
//    @State var error = ""
//    
//    @State var go = false
//    @State var showalert = false
//    
//    @State private var userisLoggedIn = false
//
//    
//    var body: some View {
//           
//        if userisLoggedIn {
//            MainView(username: $username, shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
//, productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]), basketArray: [], ProductsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
//        }
//        else {
//            contant
//        }
//    }
//    
//    var contant: some View {
//        ZStack{
//            Color.gray.opacity(0.1)
//                .ignoresSafeArea()
//            
//            Color("Color3")
//                .clipShape(Circle())
//                .offset(x: 200, y: -500)
//            
//            Color("Color3")
//                .clipShape(Circle())
//                .offset(x: -250, y: -370)
//            
//            Color("Color2")
//                .clipShape(Circle())
//                .offset(x: -30, y: -510)
//            
//            Color("Color2")
//                .clipShape(Circle())
//                .frame(width: 70, height: 70)
//                .offset(x: -170, y: 370)
//            
//            Color("Color3")
//                .clipShape(Circle())
//                .frame(width: 50, height: 50)
//                .offset(x: 150, y: 330)
//            
//            VStack {
//                VStack {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .padding(.top,100)
//                        .padding(.bottom,20)
//                    .frame(width: 400, height: 210)
//                    
//                    HStack {
//                        Text("Welcome !")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .padding(5)
//                        Spacer()
//                        
//                    }.frame(width: 350)
//                        
//                    HStack {
//                        Text("Sign in to start your journy ")
//                            .font(.title)
//                            .padding(5)
//                        
//                        Spacer()
//                    }.frame(width: 350)
//                    
//                    Spacer()
//                    
//                    TextField("User Name", text: $email)
//                        .foregroundColor(Color("Color4"))
//                        .padding()
//                        .background(.white)
//                        .cornerRadius(7)
//                        .frame(width: 330, height: 70)
//                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
//                    
//                    
//                    SecureField("Password", text: $password)
//                        .foregroundColor(Color("Color4"))
//                        .padding()
//                        .background(.white)
//                        .cornerRadius(7)
//                        .frame(width: 330, height: 70)
//                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
//                    
//                    
//                    Button {
//                        register()
//                    } label: {
//                        Text("Let's Start")
//                            .font(.system(size: 20))
//                            .fontWeight(.medium)
//                            .padding()
//                            .foregroundColor(.black)
//                            .frame(width: 330, height: 70)
//                            .background(Color("Color3"))
//                            .cornerRadius(7)
//                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 1, y: 1)
//                            .padding()
//
//                    }
//                    .onAppear {
//                        Auth.auth().addStateDidChangeListener { auth, user in
//                            if user != nil {
//                                userisLoggedIn.toggle()
//                            }
//                        }
//                    }
//
////                        NavigationLink(destination:
////                                        MainView(username: $username, shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
////                            , productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]), basketArray: [], ProductsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
////
////                            .navigationBarBackButtonHidden(true)
////                            .navigationBarHidden(true)
////
////                                       ,isActive: $go) {
////                            EmptyView()
////                        }
//
//                    
//                    Text(error)
//                        .font(.headline)
//                        .foregroundColor(.red)
//                    
//                    
//
//                }
//                
//                .alert(isPresented: $showalert) {
//                    Alert(title: Text("Error"),
//                          message: Text("Please fill in your details properly"),
//                          dismissButton: .cancel(Text("Ok")))
//            }
//                
//                
//                Text("Forget your password ?")
//                    .font(.system(size: 14))
//                    .foregroundColor(.gray)
//                    .underline()
//                Spacer()
//                
//                HStack {
//                    Text("Don't have an account? ")
//                        .font(.system(size: 14))
//                        .foregroundColor(.gray)
//                    .padding(.top,70)
//                    
//                    Button {
//                        login()
//                    } label: {
//                        Text("Signup")
//                            .font(.system(size: 18))
//                            .foregroundColor(Color("Color3"))
//                            .fontWeight(.black)
//                            .underline()
//                        .padding(.top,65)
//                    }
//
//                }
//                
//            }
//            
//        }
//        .navigationBarHidden(true)
//        
//    .accentColor(Color("Color4"))
//    }
//    
//    func correct () {
//        if username == "" || password == "" {
//            go = false
//            error = "Please fill in your details properly"
//        }
//        else {
//            go = true
//        }
//    }
//    
//    func register(){
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }
//        
//    }
//    
//    func login() {
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//            
//        }
//    }
//}
//
//
//
//
//struct logein2_Previews: PreviewProvider {
//    static var previews: some View {
//        logein()
//            .preferredColorScheme(.light)
//            
//    }
//}
//
