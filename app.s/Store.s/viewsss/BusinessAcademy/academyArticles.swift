//
//  academyArticles.swift
//  Store.s
//
//  Created by Sedra Asrawi on 04/09/2022.
//

import SwiftUI

struct academyArticles: View {
    var body: some View {
        ZStack{
            ScrollView {
                VStack{
                    VStack{
                        HStack {
                            Text("Business Tips !")
                                .font(.title)
                                .fontWeight(.medium)
                                .foregroundColor(Color("Color4"))
                                Spacer()
                        }.padding()
                            .frame(width: 390)
                        
                        Text(" 1) Be Passionate.\n 2) Start While You Are Still Employed.\n 3) Don't Do It Alone.\n 4) Get Clients or Customers Lined Up.\n 5) Write a Business Plan.\n 6) Do Your Research.\n 7) Get Professional Help.\n 8) Make Sure the Money Is Lined Up.")
                              .font(.title3)
                              .fontWeight(.thin)
                              .frame(width: 390)
                        
                        HStack {
                            Image("business2")
                                .resizable()
                                .scaledToFit()
                            .frame(width: 360, height: 300)
                            
                            
                            
                        }.padding()
                            .frame( alignment: .leading)
                        
                        Spacer()
                    }.padding()
                        .background(Color("Color1").opacity(0.4))
                        .frame(width: 370)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.3), radius: 10)
                }
                .padding()
                
                
                VStack{
                    HStack {
                        Text("Business Ideas !")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color("Color2"))
                            Spacer()
                    }.padding()
                        .frame(width: 390)
                    
                    Text(" 1) Start a dropshipping business.\n 2) Design and sell print-on-demand t-shirts\n 3) Launch your own book.\n 4) Create digital products or online courses.\n 5) Sell print-on-demand posters, greeting cards, and prints.\n 6) Start a charitable business.\n 7) Sell a service\n 8) Create an online fashion boutique")
                          .font(.title3)
                          .fontWeight(.thin)
                          .frame(width: 390)
                    
                    HStack {
                        Image("business3")
                            .resizable()
                            .scaledToFit()
                        .frame(width: 360, height: 300)
                        
                        
                    }.padding()
                        .frame( alignment: .leading)
                    
                    Spacer()
                }.padding()
                    .background(Color("Color3").opacity(0.4))
                    .frame(width: 370)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 10)
                    
            }
        }
    }
}

struct academyArticles_Previews: PreviewProvider {
    static var previews: some View {
        academyArticles()
    }
}



