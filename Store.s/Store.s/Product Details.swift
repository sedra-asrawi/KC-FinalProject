//
//  Product Details.swift
//  Store.s
//
//  Created by Sedra Asrawi on 25/08/2022.
//

import SwiftUI

struct Product_Details: View {
    @Binding var post : UIImage
    @State var ProductName = ""
    @State var ProductDetails = ""
    @State var ProductPrice = ""
    @State private var showSheet = false

    @Binding var posts : [UIImage]
    @State var savetitle = "Save"
    @State var saveback = Color("Color2")
   
    var body: some View {
        ZStack{
            
            VStack{
                
                Image(uiImage: post)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(40)
                    .ignoresSafeArea()
                    .frame(width: 390, height: 390)
                
                VStack{
                    HStack {
                        Text("Ptoduct Name : ")
                            .font(.headline)
                            .fontWeight(.medium)
                        TextField("Product Name", text: $ProductName)
                            .padding(7)
                            .background(Color("Color3").opacity(0.3))
                            .cornerRadius(10)
                    }.padding()
                        
                    Divider()
                        .padding()
                    HStack {
                        Text("Ptoduct Details : ")
                            .font(.headline)
                            .fontWeight(.medium)
                        TextEditor(text: $ProductDetails)
                            .foregroundColor(.black)
                            .colorMultiply(Color("Color3").opacity(0.3))
                            .frame(width: 280, height: 130, alignment: .leading)
                            .cornerRadius(20)
                    }
                    
                    Divider()
                        .padding()
                    
                    HStack {
                        Text("Ptoduct Price: ")
                            .font(.headline)
                            .fontWeight(.medium)
                        TextField("Product Price", text: $ProductPrice)
                            .padding(7)
                            .background(Color("Color3").opacity(0.3))
                            .cornerRadius(10)
                        Text("KD")
                            .font(.headline)
                            .fontWeight(.medium)
                    }.padding()
                        
//                    Text("Done")
//                        .font(.title)
//                        .frame(width: 300, height: 50)
//                        .background(Color("Color3"))
//                        .cornerRadius(13)
//                        .shadow(color: Color("Color3"), radius: 5)
//                        .padding()
                    
                    HStack{
                        Button {
                            
                           showSheet = true
                            
                            
                        } label: {
                            Text("Change photo")
                                .fontWeight(.medium)
                                .padding()
                                .foregroundColor(.black)
                                .frame(width: 200, height: 50)
                                .background(Color("Color3"))
                                .cornerRadius(7)
                                .shadow(color: .gray.opacity(0.4), radius: 10, x: 1, y: 1)
                                .padding()

                        }
                        
                        Button {
                            
                            posts.append(post)
                            savetitle = "Saved!"
                            saveback = Color("Color4")
                            
                        } label: {
                            Text(savetitle)
                                .fontWeight(.medium)
                                .padding()
                                .foregroundColor(.black)
                                .frame(width: 100, height: 50)
                                .background(saveback)
                                .cornerRadius(7)
                                .shadow(color: .gray.opacity(0.4), radius: 10, x: 1, y: 1)
                                .padding()

                        }
                        
                    }

//بدي ضيف تغيير الصورة
                    
                    Spacer()
                }
            }.frame(width: 390, height: 900)
            
            
                .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$post) }
        }
    }
}

struct Product_Details_Previews: PreviewProvider {
    static var previews: some View {
        Product_Details(post: .constant(UIImage(named: "red")!), posts: .constant([UIImage(named: "white")!]))
    }
}
