//
//  BusinessAcademy.swift
//  Store.s
//
//  Created by Sedra Asrawi on 03/09/2022.
//

import SwiftUI

struct BusinessAcademy: View {
    
    let learn = ["play.tv","chart.bar.doc.horizontal","gamecontroller.fill","video.bubble.left","questionmark.circle.fill"]
    
    var body: some View {
        
        ZStack {
            Color("Color3").opacity(0.7)
                .ignoresSafeArea()
            ScrollView{
                
                
                VStack {
                    VStack{
                        VStack {
                            Text("Learn How To Run You Business :")
                                .font(.title)
                            .fontWeight(.bold)
                        }.frame(width: 350, alignment: .leading)
                        
                        Image("business1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                        
                        Spacer()
                        VStack {
                            Text("Business Management")
                                .font(.title3)
                            .fontWeight(.semibold)
                        }.frame(width: 350, alignment: .leading)
                        
                            HStack {
                                Text("Business and Management are the disciplines devoted to organizing, analyzing, and planning various types of business operations. And if that sounds really general, that’s just because these fields cover a lot of ground. These degree programs teach the fundamental skills that are required to efficiently run or manage a business. That’s why you’ll find Business and Management majors in every industry, in a variety of different types of jobs. So, whether you want to work for a large corporation, or in a mom-and-pop shop, you can be confident that a degree in Business and Management will teach you the skills and theory you need for a successful career. The possible job titles for Business and Management majors are practically unlimited. They range from financial managers, who use their mathematical skills to generate financial forecasts, to marketing managers, who draw upon their creativity to manage advertising and sales efforts.")
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                                       .lineLimit(400)
                                   .frame(height: 500, alignment: .leading)
                                   .padding()
                                   
                            }
                        Spacer()
                        
                        VStack {
                            Text("You'll Learn Using : ")
                                .font(.title2)
                            .fontWeight(.semibold)
                            .underline()
                        }.frame(width: 350, alignment: .leading)
                            .padding(.top,100)
                        
                        HStack {
                                VStack{
                                    Image(systemName: "play.tv")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35, height: 35)
                                        .padding()
                                        .foregroundColor(Color("Color4"))
                                        .background(Color("Color3").opacity(0.4))
                                        .cornerRadius(20)
                                    
                                    Text("Videos")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("Color4"))
                                    
                                }
                            VStack{
                                Text("articles")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("Color4"))

                                Image(systemName: "chart.bar.doc.horizontal")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                    .padding()
                                    .foregroundColor(Color("Color4"))
                                    .background(Color("Color3").opacity(0.4))
                                    .cornerRadius(20)
                                
                            }
                            VStack{
                                Image(systemName: "gamecontroller.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                    .padding()
                                    .foregroundColor(Color("Color4"))
                                    .background(Color("Color3").opacity(0.4))
                                    .cornerRadius(20)
                                Text("Games")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("Color4"))
                                
                            }
                            VStack{
                                Text("Lessons")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("Color4"))

                                Image(systemName: "video.bubble.left")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                    .padding()
                                    .foregroundColor(Color("Color4"))
                                    .background(Color("Color3").opacity(0.4))
                                    .cornerRadius(20)
                                
                            }
                            VStack{
                                Image(systemName: "questionmark.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                    .padding()
                                    .foregroundColor(Color("Color4"))
                                    .background(Color("Color3").opacity(0.4))
                                    .cornerRadius(20)
                                Text("Help")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("Color4"))
                                
                            }
                            
                        }.padding(.top,15)
                        
                        Divider()
                            .padding()
                        
                        VStack {
                            Text("It's All About :")
                                .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Color2"))
                        .padding(.top,30)
                            
                            HStack {
                                VStack{
                                    Image("thinking")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                        .background(.white)
                                        .cornerRadius(10)
                                    Text("Thinking")
                                        .font(.headline).foregroundColor(Color("Color4"))
                                }.padding()
                                VStack{
                                    Image("planning")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                        .background(.white)
                                        .cornerRadius(10)
                                    Text("Planning")
                                        .font(.headline).foregroundColor(Color("Color4"))
                                }.padding()
                            }
                            HStack {
                                VStack{
                                    Image("trying")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                        .background(.white)
                                        .cornerRadius(10)
                                    Text("Trying")
                                        .font(.headline).foregroundColor(Color("Color4"))
                                }.padding()
                                VStack{
                                    Image("Starting!")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                        .background(.white)
                                        .cornerRadius(10)
                                    Text("Starting!")
                                        .font(.headline).foregroundColor(Color("Color4"))
                                }.padding()
                            }
                            
                            
                        }.frame(width: 350, height: 500,alignment: .top)
                        .background(
                        Color("Color1")
                            .cornerRadius(20)
                            
                        ).shadow(color: Color("Color2").opacity(0.5), radius: 10)
                        
                        
                        

                        
                    }
                    .padding()
                    
                    NavigationLink {
                        customTabBar()
                    } label: {
                        Text("Start Learning")
                            .font(.title3)
                            .padding()
                            .frame(width: 250)
                            .background(Color("Color2"))
                            .cornerRadius(6)
                            .foregroundColor(.black)
                            .shadow(color: .gray.opacity(0.5), radius: 10)
                        
                    }.padding(.top,40)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct BusinessAcademy_Previews: PreviewProvider {
    static var previews: some View {
        BusinessAcademy()
    }
}

