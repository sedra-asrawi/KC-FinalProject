//
//  Product Details.swift
//  Store.s
//
//  Created by Sedra Asrawi on 25/08/2022.
//

import SwiftUI

struct Product_Details: View {
//    @Binding var post : UIImage
//    @Binding var ProductName : String
//    @Binding var ProductDetails : String
//    @Binding var ProductPrice : String
    @State private var showSheet = false

    @Binding var postsArray : [DetailsModel]
    @State var savetitle = "Save"
    @State var saveback = Color("Color2")
    
    @State var showerror = false
    
    @State var ProdictsDetails : DetailsModel
   
    var body: some View {
        ZStack{
            
            VStack{
                
                Image(uiImage: self.ProdictsDetails.prodImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(40)
                    .ignoresSafeArea()
                    .frame(width: 390, height: 390)
                
                    .alert(isPresented: $showerror) {
                        Alert(title: Text("Forgot Something? 👀"),
                              message: Text("please add the product's info"),
                              dismissButton: .cancel()) }
                
                VStack{
                    HStack {
                        Text("Ptoduct Name : ")
                            .font(.headline)
                            .fontWeight(.medium)
                        TextField("Product Name", text: $ProdictsDetails.prodName)
                            .padding(7)
                            .background(Color("Color3").opacity(0.3))
                            .cornerRadius(1)
                    }.padding()
                        
                    Divider()
                        .padding()
                    HStack {
                        Text("Ptoduct Details : ")
                            .font(.headline)
                            .fontWeight(.medium)
                        Spacer()
                        TextEditor(text: $ProdictsDetails.prodDet)
                            .foregroundColor(.black)
                            .colorMultiply(Color("Color3").opacity(0.3))
                            .frame(width: 250, height: 130, alignment: .leading)
                        
                            .cornerRadius(1)
                    }.padding(.horizontal)
                    
                    Divider()
                        .padding()
                    
                    HStack {
                        Text("Ptoduct Price: ")
                            .font(.headline)
                            .fontWeight(.medium)
                        TextField("Product Price", text: $ProdictsDetails.prodPrice)
                            .padding(7)
                            .background(Color("Color3").opacity(0.3))
                            .cornerRadius(1)
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
                            
                            if ProdictsDetails.prodImage == UIImage(named: "white")! || ProdictsDetails.prodName == "" || ProdictsDetails.prodDet == "" || ProdictsDetails.prodPrice == "" {
                          
                                showerror = true

                            }
                            else {
                                
                                postsArray.insert(ProdictsDetails, at: 0)
                                savetitle = "Saved!"
                                saveback = Color("Color4")
                            }
                          
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
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$ProdictsDetails.prodImage)
            }
        }
    }
}

struct Product_Details_Previews: PreviewProvider {
    static var previews: some View {
        Product_Details(postsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(named: "white")!, plus: "", line: "")]), ProdictsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage(named: "white")!, plus: "", line: "")
//                        ,ProdictsDetails: .constant(DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
        )
    }
}

