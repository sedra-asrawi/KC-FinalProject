//
//  ChatView.swift
//  Store.s
//
//  Created by Sedra Asrawi on 05/09/2022.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var messageData: MessageViewModel = MessageViewModel()
    @State var plusoptions = ["share shopping basket"]
    @State var option = ""
    
    var body: some View {
        
//        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15){
                    
                    ForEach(messageData.messages){message in
                        
                        CardView(message: message)
                            
                    }
                }
            }.padding()
            
            .safeAreaInset(edge: .bottom) {
                
                HStack(spacing: 12){
                    
                    
                    Menu("+") {
                        Picker("Please choose a color", selection: $option)
                            {
                                ForEach(plusoptions, id: \.self) {
                                    Text($0)
                                }
                            }
                            
                    }.font(.title)
                        
                    
                    
//                    Button {
//
//                    } label: {
//                        ZStack {
//                            Image(systemName: "plus")
//                                .font(.system(size: 20))
//
//
//                        }
//
//
//                    }

                    
                    TextField("Enter Message", text: $messageData.message)
                        .padding(5)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(15)
                        .textCase(.lowercase)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                        
                    
                    Button {
                        messageData.sendMessage()
                    } label: {
                        
                        Image(systemName: "paperplane.fill")
                            .font(.title3)
                    }

                }
                .padding()
                .padding(.top)
                .background(Color("Color4").opacity(0.3).blur(radius: 10).ignoresSafeArea())
            }
            .navigationTitle("Chat box")
            .navigationBarHidden(true)
//        }
        .background(.white)
        .accentColor(Color("Color4"))
        
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)
    }
    
    @ViewBuilder
    func CardView(message: Message)->some View{
        
        Group{
            
           
            if message.previewLoading{
                
                Group{
                    
                    if let metaData = message.linkMetaData{
                        
                        LinkPreview(metaData: metaData)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getRect().width - 80,alignment: .leading)
                            .cornerRadius(15)
                            .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    else{
                        HStack(spacing: 10){
                            
                            Text(message.linkURL?.host ?? "")
                                .font(.caption)
                            
                            ProgressView()
                                .tint(.white)
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.35))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                }
            }
            else{
                
                Text(message.messageString)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(Color("Color4"))
                    .cornerRadius(10)
                
                    .frame(width: getRect().width - 80,alignment: .trailing)
                    .frame(maxWidth: .infinity,alignment: .trailing)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


//extension View{
//    func getRect()->CGRect{
//        return UIScreen.main.bounds
//    }
//}
