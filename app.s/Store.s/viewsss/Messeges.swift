//
//  Messeges.swift
//  Store.s
//
//  Created by Sedra Asrawi on 02/09/2022.
//

import SwiftUI

struct Messeges: View {
    
//    @State var username : String
    @State var messageTo = false
    @State var ToName : String
    
    var body: some View {
//        NavigationView {
            ZStack{
                VStack{
                    HStack {
                        Image("Ananas")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                            .padding(.trailing,5)
                            .shadow(color: .black, radius: 3)
                        
                        VStack(spacing: 3) {
                            Text("Name")
                                .font(.title2)
                            .fontWeight(.semibold)
                            
                            HStack {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 13))
                                    .foregroundColor(.green)
                                
                                Text("Online")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.top,2)
                            }
                            
                        }
                        
                        Spacer()
                        
                        Image(systemName: "gear")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }.padding()
                    
                        .padding(.bottom,40)
                        .padding(.top,20)
                        .background(
                            Color("Color3").opacity(0.5)
                                .blur(radius: 20)
                                .ignoresSafeArea()
                        
                        )
                    
                    ScrollView {
                        
                        ForEach(1...20, id: \.self){
                            person in
                            
                            NavigationLink {
                                ChatView()
                            } label: {
                                HStack{
                                    Image("profilepic")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width: 40, height: 40)
                                        .padding(7)
                                        .shadow(color: .black, radius: 3)
                                    
                                    VStack {
                                        HStack {
                                            Text("Name")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                Spacer()
                                        }
                                        
                                        HStack {
                                            Text("Click to message user")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            .padding(.top,2)
                                            Spacer()
                                        }
                                    }.frame( alignment: .leading)
                                    
                                    
                                }.padding(.horizontal)
                                Divider()
                                    .padding(.horizontal)
                            }


                        }
                    }
                    
                    Button {
                        
                        
                    } label: {
                        HStack {
                            Text("New Message")
                                .padding(4)
                                .foregroundColor(.black)
                            
                            Image(systemName: "pencil.and.outline")
                        }.frame(width: 250, height: 45)
                            .foregroundColor(.black)
                        .background(Color("Color3"))
                        .cornerRadius(20)
                        .shadow(color: Color("Color3"), radius: 5)
                    }

                    
                    Spacer()
                }
                
               
                .navigationBarHidden(false)
            }
//        }
    }
}

struct Messeges_Previews: PreviewProvider {
    static var previews: some View {
        Messeges(ToName: "")
    }
}

//import HalfASheet
//
//struct messageToView : View {
//
//    @State var To : String
//
//    var body: some View {
//
//        ZStack{
//
//            VStack{
//                HStack {
//                    Text("To :")
//                    TextField("",text: $To)
//                        .frame(width: 100, height: 25)
//                        .background(Color("Color3").opacity(0.2))
//                        .cornerRadius(10)
//                    }.padding()
//
//                NavigationLink {
//                    ChatView()
//                } label: {
//                    Text("Message !")
//                        .padding()
//                        .foregroundColor(.black)
//                        .frame(width: 250, height: 50)
//                        .background(Color("Color3"))
//                        .cornerRadius(20)
//                        .shadow(color: .gray.opacity(0.3), radius: 10)
//                }
//
//            }
//        }
//
//    }
//
//}
//
//struct messageToView_Previews: PreviewProvider {
//    static var previews: some View {
//        messageToView(To: "")
//    }
//}
