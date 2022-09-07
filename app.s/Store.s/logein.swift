//
//  ContentView.swift
//  store.s
//
//  Created by Sedra Asrawi on 22/08/2022.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signin(email: String, password: String){
        auth.signIn(withEmail: email, password: password) {  [weak self] result, error in
            
            guard result != nil , error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
            
        }
    }
    
    
    func signup(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result , error in
            guard result != nil , error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
        }
    }
}




struct logein: View {
    
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

    @EnvironmentObject var viewModel : AppViewModel
    
    
    var body: some View {
                NavigationView {
        
        if viewModel.signedIn {
            MainView(username: $username, shopDet: .constant(shopModel(shopName: "", shopLogo: UIImage(), shoptype: ""))
                , productsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(), plus: "", line: "")]), basketArray: [], ProductsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
        }
        else{
            signup()
        }
        
            
//            .navigationBarHidden(true)
//            .accentColor(Color("Color4"))
                }.onAppear {
                    viewModel.signedIn = viewModel.isSignedIn
                }
    }
    
    
    
    
//    func correct () {
//        if username == "" || password == "" {
//            go = false
//            error = "Please fill in your details properly"
//        }
//        else {
//            go = true
//        }
//    }
  
}

struct logein_Previews: PreviewProvider {
    static var previews: some View {
        logein()
            
    }
}
