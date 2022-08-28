//
//  Buy2.swift
//  Store.s
//
//  Created by Sedra Asrawi on 28/08/2022.
//

import SwiftUI

struct Buy2: View {
    
    @State var cakes = ["cake1","cake2","cake3","cake5"]
    @State var cakes2 = ["cake4","cake6"]

    
    let colums :[GridItem] = [
        GridItem(.fixed(150), spacing: 30, alignment: nil),
        GridItem(.fixed(150), spacing: 30, alignment: nil)
    ]
    
    var body: some View {
//        NavigationView {
            VStack{
//                        Image("red")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 390, height: 296)
//                            .cornerRadius(10)
//                            .frame(height: 10)
                        
//                        Text("Restaurant name")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundColor(.black.opacity(0.8))
//                            .frame(width: 360, alignment: .leading)
//                            .padding(.top,50)
                        
                        
//                        HStack {
//                            Text("Menu :")
//                                .font(.system(size: 23))
//                                .fontWeight(.medium)
//
//                            Spacer()
//
//                        }.padding(.top,10)
//                        .padding(.leading,15)
                    
                    
                    List {
                        Section(header: Text("Mini Cake")
                            .font(.system(size: 17))
                            .foregroundColor(Color("Color4"))){
                                
                                ForEach(cakes, id: \.self){
                                    cake in
                                    
                                    HStack{
                                        
                                            Image(cake)
                                                .resizable()
                                                .scaledToFit()
                                            .frame(width: 110, height:110)
                                            .cornerRadius(5)
                                            .frame(width: 110, height:130)
                                        .shadow(color: .gray.opacity(0.3), radius: 10)

                                        Text("this \n is \n details")
                                            .font(.headline)
                                            .fontWeight(.thin)
                                            .padding()
                                        


                                    Spacer()
                                }
                                    
                                }
                                
                            }
                        
                        Section(header: Text("6'' Cake")
                            .font(.system(size: 17))
                            .foregroundColor(Color("Color4"))){
                                
                                ForEach(cakes2, id: \.self){
                                    cake in
                                    
                                    HStack{
                                            Image(cake)
                                                .resizable()
                                                .scaledToFit()
                                            .frame(width: 110, height:110)
                                            .cornerRadius(5)
                                            .frame(width: 110, height:130)

                                        .shadow(color: .gray.opacity(0.3), radius: 10)

                                        Text("this \n is \n details")
                                            .font(.headline)
                                            .fontWeight(.thin)
                                            .padding()

                                    Spacer()
                                }
                                    
                                }
                                
                            }
                        
                        
                    }.accentColor(Color("Color4"))
//                    LazyVGrid(columns: colums) {
//                        ForEach(cakes, id: \.self) { cake in
//                            HStack {
//                                VStack {
//                                    Image(cake)
//                                        .resizable()
//                                        .scaledToFit()
//                                    .frame(width: 150, height: 150)
//                                    .cornerRadius(10)
//                                    .padding()
//                                .shadow(color: .gray.opacity(0.3), radius: 10)
//
//                                    Text("Price")
//                                        .padding(.bottom)
//                                }.frame(height: 200)
//
//
//                            Spacer()
//                        }.padding(.leading,15)
//
//
//                    }
//
//                    }.padding(.top,10)
                    
                
                
                Spacer()
                
            }
            .navigationTitle("Restaurant name")
//        }
    }
}

struct Buy2_Previews: PreviewProvider {
    static var previews: some View {
        Buy2()
    }
}
