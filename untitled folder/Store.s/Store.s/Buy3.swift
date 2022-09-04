//
//  Buy3.swift
//  Store.s
//
//  Created by Sedra Asrawi on 30/08/2022.
//

import SwiftUI

struct Buy3: View {
    
    @State var ProdictsDetails : DetailsModel
    @Binding var ProdictsDetailsArray : [DetailsModel]
    @State var basketArray : [DetailsModel] = []

    @State var quantity = 1

    func Total () -> Double {
       return
        (Double(quantity) * (Double(ProdictsDetails.prodPrice) ?? 0))
    }
    
    @State var addtobasketText = "Add To Basket For"
    @State var addtobasketColor = Color("Color3")

    var body: some View {
//        NavigationView {
            ZStack{
                
                Color("graycolor")
                    .ignoresSafeArea()
                
                VStack{
                    
                    VStack{
                        ScrollView{
                            
                            VStack{
                                Image(uiImage: self.ProdictsDetails.prodImage)
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(40)
                                    .frame(width: 400, height: 300)
                                    .ignoresSafeArea()
                                    .cornerRadius(20)
                                    .shadow(color: .gray, radius: 15)
                                
                                HStack {
                                    Spacer()
                                    Text(ProdictsDetails.prodName)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .underline(color: .black)
                                        .padding(7)
                                        .cornerRadius(1)
                                    Spacer()
                                    
                                }.padding()
                                    
                            
                                HStack {
                                   
                                    Spacer()
                                    HStack {
                                        Text(ProdictsDetails.prodDet)
                                            .foregroundColor(.black)
                                            .padding()
                                            .colorMultiply(Color("Color3").opacity(0.5))
                                            .frame(width: 350, height: 150, alignment: .leading)
                                            .border(Color("Color3"))

                                        
                                        Spacer()
                                    }.padding(.horizontal)
                                    Spacer()
                                }.padding(.horizontal)
                                
                                    .padding()
                                
                                HStack {
                                    Text("Price: ")
                                        .font(.headline)
                                        .fontWeight(.medium)
                                    Text(ProdictsDetails.prodPrice)
                                        .padding(7)
                                        .background(Color("Color3").opacity(0.3))
                                        .font(.headline)
                                        .cornerRadius(1)
                                    Text("KD")
                                        .font(.headline)
                                        .fontWeight(.medium)
                                    
                                    Spacer()
                                }.frame(width: 350, height: 60, alignment: .leading)
                                    
                            }
                            
                        }.ignoresSafeArea()
                          Spacer()

                       Divider()
                        

                    }
                    
                    HStack{
                        Button {
                            quantity += 1
                            
                            addtobasketText = "Add To Basket For"
                            addtobasketColor = Color("Color3")
                            
                        } label: {
                            Image(systemName: "plus")
                                .frame(width: 13, height: 13)
                                .font(.system(size: 18, weight: .black))
                                .padding(5)
                                .foregroundColor(Color("Color4"))
                                .background(Circle()
                                    .fill(Color("graycolor"))
                                    .frame(width: 21, height: 21)

                                )
                                .background(Circle()
                                    .fill(Color("Color4"))
                                    .frame(width: 27, height: 27)
                                )

                                
                        }
                        Text("\(quantity)")
                        .frame(width: 23, height: 20)
                        .foregroundColor(.black)
                        
                        
                        Button {
                            if quantity > 1 {
                                quantity -= 1 }
                        } label: {
                            Image(systemName: "minus")
                                .frame(width: 13, height: 13)
                                .font(.system(size: 18, weight: .black))
                                .padding(5)
                                .foregroundColor(Color("Color4"))
                                .background(Circle()
                                    .fill(Color("graycolor"))
                                    .frame(width: 21, height: 21)

                                )
                                .background(Circle()
                                    .fill(Color("Color4"))
                                    .frame(width: 27, height: 27)
                                )

                                
                        }
                    }.padding()
                    
                    HStack{
                        
                        NavigationLink {
                            Basket(basketArray: basketArray, ProductsDetails: ProdictsDetails)
                        } label: {
                            Image(systemName: "bag.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.horizontal)
                            
                        }

                        
                        Button {
                            
                            basketArray.insert(ProdictsDetails, at: 0)
                            addtobasketText = "✔️"
                            addtobasketColor = Color("Color2")
                            quantity = 0
                            
                        } label: {
                            HStack{
                                Text("\(addtobasketText)")
                                Text(String(Total()))
                            }.padding()
                            .padding(.horizontal)
                                .background(addtobasketColor.frame(width: 260))
                                .frame(width: 260)
                                .cornerRadius(5)
                                .foregroundColor(.black)
                                .font(.headline)
                                .shadow(color: Color("Color3"), radius: 10)

                            

                        }
                    }.frame(width: 320)

                    Spacer()
                    
                }.frame(width: 390, height: 700)
                
                
              
            }
//        }
    }
}

struct Buy3_Previews: PreviewProvider {
    static var previews: some View {
        Buy3(ProdictsDetails: DetailsModel(prodName: "name", prodDet: "details", prodPrice: "10", prodImage: UIImage(named: "Ananas")!),ProdictsDetailsArray: .constant([DetailsModel(prodName: "", prodDet: "", prodPrice: "", prodImage: UIImage())])
        )
    }
}
