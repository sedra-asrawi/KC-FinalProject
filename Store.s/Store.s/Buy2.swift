//
//  Buy2.swift
//  Store.s
//
//  Created by Sedra Asrawi on 28/08/2022.
//

import SwiftUI

struct Buy2: View {
    
    @Binding var prodName : String
    @Binding var productDet : DetailsModel
    @Binding var products : [UIImage]
    

    
    let colums :[GridItem] = [
        GridItem(.fixed(150), spacing: 30, alignment: nil),
        GridItem(.fixed(150), spacing: 30, alignment: nil)
    ]
    
    
    
    var body: some View {
//        NavigationView {
            VStack{
                       List {
          
                           ForEach(products, id: \.self){
                                    product in
                                    
                                    HStack{
                                        
                                        Image(uiImage: product)
                                                .resizable()
                                                .scaledToFit()
                                            .frame(width: 110, height:110)
                                            .cornerRadius(5)
                                            .frame(width: 110, height:130)
                                        .shadow(color: .gray.opacity(0.3), radius: 10)

                                        Text("\(prodName)")
                                            .font(.headline)
                                            .fontWeight(.thin)
                                            .padding()
                                        


                                    Spacer()
                                }
                                    
                                }
                          
                    }.accentColor(Color("Color4"))

                
                Spacer()
                
            }
            .navigationTitle("Restaurant name")
//        }
    }
}

struct Buy2_Previews: PreviewProvider {
    static var previews: some View {
        Buy2(prodName: .constant(""), productDet: .constant(DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())), products: .constant([UIImage()]))
    }
}
