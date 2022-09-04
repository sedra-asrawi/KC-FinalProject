//
//  academyHelp.swift
//  Store.s
//
//  Created by Sedra Asrawi on 04/09/2022.
//

import SwiftUI

struct academyHelp: View {
    
    @State var helpalert = false
    @State var errorText = ""
    
    @State var help = ""
    var body: some View {
        ZStack{
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            VStack{
//                Text("Help Center")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding()
//                    .padding(.top,50)
                Spacer()
                Image("help")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width: 250, height: 250)
                    .padding()
                HStack {
                    Text("How Can We Help You ?")
                        .font(.title3)
                        .fontWeight(.medium)
                    Spacer()
                }.padding()
                
                TextEditor(text: $help)
                    .frame(width: 350, height: 150)
                    .border(Color("Color3"), width: 3)
                    .padding()
                
                Button {
                    if help == "" {
                        errorText = "please write your question"
                    }
                    else{
                        helpalert = true
                        errorText = ""
                    }
                    
                } label: {
                    Text("Send")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal)
                        .background(Color("Color3"))
                        .cornerRadius(5)
                        .shadow(color: Color("Color3"), radius: 10)
                        
                      
                }

                Text(errorText)
                   .font(.caption)
                   .foregroundColor(.red)
                   .padding(.bottom,50)
                
                Spacer()
            }
            
            .alert(isPresented: $helpalert) {
                Alert(title: Text("Done !"),
                      message: Text("We've recieved You Question and we'll be back to you soon 🥰"), dismissButton: .cancel())
            }
        }
    }
}

struct academyHelp_Previews: PreviewProvider {
    static var previews: some View {
        academyHelp()
    }
}
