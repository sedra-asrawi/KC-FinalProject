//
//  Sell1.swift
//  store.s
//
//  Created by Sedra Asrawi on 22/08/2022.
//

import SwiftUI

struct Sell1: View {
    
    @State var username = ""
    @State var password = ""
    @State var iconback : Color = .clear
    @State var StoreName = ""
    @State var StoreType = ""
    @State var types = ["other","food","gifts","clothes","technology"]
    @State var selectedNumber: Int = 0
    @State var logo = UIImage(named: "white")!
    @State var isShowingImagePicker = false
    @State private var image = UIImage(named: "white")!
    @State private var showSheet = false
    @State var storesName : [UIImage]
    
    
  
    
    var body: some View {
        
            ZStack {
                    Color.gray.opacity(0.1)
                        .ignoresSafeArea()
                    ZStack {
                            VStack {
                                
                                
                                HStack {
                                    Text("Start Your Business !")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(5)
                                    Spacer()
                                    
                                }.frame(width: 350)
                                    
                                HStack {
                                    VStack{
                                        HStack {
                                            Text("Let's Make Your Store ,")
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Shall We ?")
                                            Spacer()
                                        }
                                    } .font(.title)
                                      .padding(5)
                                    
                                    Spacer()
                                }.frame(width: 350)
                                
                                Spacer()
                                
                                TextField("Store Name", text: $StoreName)
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(7)
                                    .frame(width: 330, height: 70)
                                    .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                                
                                
                                
                                Menu("Choose Store's Speciality") {
                                        Picker("Please choose a color", selection: $StoreType)
                                        {
                                            ForEach(types, id: \.self) {
                                                Text($0)
                                            }
                                        }
                                        
                                    }
                                         .foregroundColor(Color("Color4"))
                                         .padding()
                                         .frame(width: 330, height: 55)
                                         .background(.white)
                                         .cornerRadius(7)
                                             .padding()
                                
                                
                                HStack {
                                    Text("your store is specialized in : ")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("Color2"))
                                    
                                    Text("\(StoreType)")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("Color2"))
                                    
                                }
                                
                                
                                Button {
                                    
                                    showSheet = true
                                    
                                }
                            
                            label: {
                                    Text("Choose Store's Logo")
                                        .fontWeight(.light)
                                        .foregroundColor(.black)
                                        .padding()
                                        .frame(width: 330, height: 55)
                                        .background(.white)
                                        .cornerRadius(7)
                                        .padding()
                            }
                                
                                Image(uiImage: self.image)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 70, height: 70)
                                    .shadow(color: .gray.opacity(0.4), radius: 10)
                                

                                NavigationLink {
                                     
                                    Sell2_1(image: $image, StoreName: $StoreName, storesName: $storesName, ProdictsDetails: DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage()))
                                        .navigationBarBackButtonHidden(true)
//
                                } label: {
                                    Text("Let's Start")
                                        .font(.system(size: 20))
                                        .fontWeight(.medium)
                                        .padding()
                                        .foregroundColor(.black)
                                        .frame(width: 330, height: 70)
                                        .background(Color("Color3"))
                                        .cornerRadius(7)
                                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 1, y: 1)
                                        .padding()
//                                        
                                        
                                        }
                                Spacer()
                                }
                                
                                
                                
                                
                                
                               }
                        .padding(.bottom,50)
                        .sheet(isPresented: $showSheet) {
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                    }
            }
           
       
        
            

        }

    


    


struct Sell1_Previews: PreviewProvider {
    static var previews: some View {
        Sell1(storesName: [UIImage(named: "Ananas")!])
    }
}
}



