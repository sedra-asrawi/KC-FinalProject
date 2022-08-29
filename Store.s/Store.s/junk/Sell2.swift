//
//  Sell2.swift
//  store.s
//
//  Created by Sedra Asrawi on 23/08/2022.
//

import SwiftUI

struct Sell2: View {
    @State var selction : String = "home"
    @State var selectedTab = 3
    let colums :[GridItem] = [
        GridItem(.fixed(120), spacing: nil, alignment: nil),
        GridItem(.fixed(120), spacing: nil, alignment: nil),
        GridItem(.fixed(120), spacing: nil, alignment: nil)
    ]
    @State private var showSheet = false
    @State private var post = UIImage(named: "white")!
    @State var back : Image = Image("white")
    @Binding var StoreName : String
    @Binding var image : UIImage
    @State var GoToDetails = false
    @Binding var storesName : [UIImage]
    @State var publishText = "Publish My Store"
    @State var publishColor = Color("Color3")
    @State var closeDetails = false

    @State var posts = [UIImage(named: "white")!]

    

    var body: some View {
            ZStack{
                            Image("5")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 420)

                    VStack{
                        HStack {
                            
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 80, height: 80)
                                .shadow(color: .gray.opacity(0.4), radius: 10)
                                .padding(.leading,35)
                                .padding(.top,40)
                            
                            Text("\(StoreName)")
                                .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.leading,10)
                            .padding(.top,40)
                            
                            
                            Spacer()
                            
                            
                            Button {
                               storesName.append(image)
                                publishText = "Your Store is out !"
                                publishColor = Color("Color1")
                                
                                
                            } label: {
                                
                               Text(publishText)
                                    .font(.system(size: 13))
                                    .padding(9)
                                    .background(publishColor)
                                    .cornerRadius(5)
                                    .foregroundColor(.black)
                                    .padding(.top,90)
                                    .padding(.horizontal)
                                    .shadow(color: .gray.opacity(0.3), radius: 10)
                                
                            }

                            
                        }
                        Divider()
                            .padding()
                        Spacer()
                        
                        ScrollView{
                            LazyVGrid(columns: colums) {
                                ForEach(1..<100, id: \.self) { box in
                                  Rectangle()
                                     .overlay(Image(uiImage: self.post)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120, height: 120)
                                        
                                     )
                                     .frame(height: 120)
                                    
                                     .overlay(Image(systemName: "plus")
                                     .foregroundColor(
                                        post !== (UIImage(named: "white")) ? Color.clear : Color("Color2")
                                        
                                     )
                                     .font(.system(size: 30))
                                     .padding()
                                     .shadow(color: Color("Color2"), radius: 10)
                                            )
//                                     .shadow(color: .gray.opacity(0.1), radius: 5)
                                     .onTapGesture {
                                         
                                         if post !== (UIImage(named: "white")) {
                                             GoToDetails = true
                                         }
                                         else {
                                             showSheet = true
                                         }
          
                                     }
                                    
                                    
                                    
                                    
                                    
                                }
                            }.padding()
                                .shadow(color: .gray.opacity(0.1), radius: 20)
                                .padding()
                        }
                   
                        
                        NavigationLink {
                            NavigationBar(username2: "Sedra", storeName: $storesName, shopsName: $StoreName)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Image("Home")
                                .resizable()
                                .scaledToFit()
                            
                                .frame(width: 40, height: 40)
                                
                                .padding(.bottom,30)
                                .padding(.top,10)
                                
                        }

                        
                        
                        
                        
                        
                    }.frame(width: 390, height: 750)
                   
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    

                        
                    
                        .sheet(isPresented: $showSheet) {
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$post)
                            
                }
              
                        .sheet(isPresented: $GoToDetails) {
                            Product_Details(post: $post, posts: $posts, ProdictsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
                        }
                
            
            }
        
}

struct Sell2_Previews: PreviewProvider {
    static var previews: some View {
        Sell2(StoreName: .constant("store name"), image: .constant(UIImage(named: "Ananas")!), storesName: .constant([UIImage(named: "Ananas")!])
        )
    }
}
}
