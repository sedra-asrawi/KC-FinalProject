//
//  Sell2.swift
//  store.s
//
//  Created by Sedra Asrawi on 23/08/2022.
//

import SwiftUI

struct Sell2: View {
    @State var username = ""
    @State var password = ""
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
    
    var body: some View {
            ZStack{
                            Image("5")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 420)

                    VStack{
                        HStack {
                            
                            Image("white")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 50, height: 50)
                                .shadow(color: .gray.opacity(0.4), radius: 10)
                                .padding(.leading,35)
                                .padding(.top,40)
                            
                            Text("store name")
                                .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.leading,10)
                            .padding(.top,40)
                            
                            
                            Spacer()
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
                                     )
                                     .frame(height: 120)
                                     .overlay(Image(systemName: "plus")
                                     .foregroundColor(Color("Color2"))
                                     .font(.system(size: 30))
                                     .padding()
                                     .shadow(color: Color("Color2"), radius: 10)
                                            )
//                                     .shadow(color: .gray.opacity(0.1), radius: 5)
                                     .onTapGesture {
                                         
                                         showSheet = true
                                     }
                                }
                            }.padding()
                                .shadow(color: .gray.opacity(0.1), radius: 20)
                                .padding()
                        }
                   
                        
                        NavigationLink {
                            Home()
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
              
                
            
            }
        
}

struct Sell2_Previews: PreviewProvider {
    static var previews: some View {
        Sell2()
    }
}
}
