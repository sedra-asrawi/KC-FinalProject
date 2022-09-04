//
//  academyVideos.swift
//  Store.s
//
//  Created by Sedra Asrawi on 04/09/2022.
//

import AVKit
import SwiftUI

struct academyVideos: View {
    
    @State var goToVid = false
    @State var videos : [vidModel]
    
    @State var videoCollection =
    [
        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump1"), vidTitle: "1. everything you need to know about business and startup basics"),

        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump2"), vidTitle: "2. Business Ideas that Will Be BIG in 2022"),
        
        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump3"), vidTitle: "3. Business Planning course"),
        
        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump4"), vidTitle: "4. How to make videos for business"),
        
        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump5"), vidTitle: "5. understanding entrepreneurship basics and fundamentals")

    ]

    var body: some View {
        
//        NavigationView {
        ScrollView {
            ZStack{
                
                VStack {
                    ForEach(videoCollection) {
                            video in
                            
                            VStack {
                                video.vidImage
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(color: Color.gray.opacity(0.5), radius: 2)

                                    .border(.white, width: 5)
                                    .shadow(color: Color("Color1"), radius: 10)

                                    .frame(width: 350, height: 210)
                                    .cornerRadius(5)
                                    .clipped()
                                    .padding(.horizontal)
                                    .overlay(Image(systemName: "play.fill")
                                        .padding()
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .background(Circle()
                                            .fill(.black.opacity(0.4))
                                                   ).onTapGesture {
                                        goToVid = true
                                    })

                                    
                                                                
                                HStack {
                                    Text(video.vidTitle)
                                        .font(.title3)
                                    .fontWeight(.semibold)
                                    Spacer()
                                }.padding(.horizontal)

                                
                                Divider()
                                    .padding()
                                Spacer()
                            }
                            
                            .fullScreenCover(isPresented: $goToVid) {
                                vidSheet(commentsArray: [], comments: commentModel(comment: ""), videos: videos, urll: "https://bit.ly/swswift", title: video.vidTitle)
                        }
                    }
                }
            }.padding(.top,40)
                .padding(.bottom,75)
//            .navigationBarHidden(true)
        }.background(Color("Color1").opacity(0.8))
//        }
        
    }
}

struct academyVideos_Previews: PreviewProvider {
    static var previews: some View {
        academyVideos(videos: [vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("Ananas"), vidTitle: "wharever")])
    }
}

struct vidSheet : View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @State var like = "hand.thumbsup"
    @State var dislike = "hand.thumbsdown"
    @State var download = "square.and.arrow.down"
    @State var share = "arrowshape.turn.up.right"
    @State var save = "plus.square.fill.on.square.fill"

    @State var forColor1 : Color = Color.black.opacity(0.7)
    @State var forColor2 : Color = Color.black.opacity(0.7)
    @State var forColor3 : Color = Color.black.opacity(0.7)
    @State var forColor4 : Color = Color.black.opacity(0.7)
    @State var forColor5 : Color = Color.black.opacity(0.7)
    
    @State var commentsArray : [commentModel]
    @State var comments : commentModel
    
    @State var videos : [vidModel]
    @State var urll : String
    
    @State var title : String
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
                .frame(height: 200)
                .offset(y: -300)
            ScrollView {
                VStack{
                    VStack{
                        VideoPlayer(player: AVPlayer(url:  URL(string: "https://bit.ly/swswift")!))
                            .frame(height: 230)
                            .overlay(
                                
                                Button(action: {
                                    
                                    presentationMode.wrappedValue.dismiss()
                                    
                                }, label: {
                                    Image(systemName: "xmark")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding()
                                })
                                
                                
                                , alignment: .topLeading)
                            
                        HStack {
                            Text(title)
                                .font(.headline)
                            Spacer()
                        }.padding()
                        
                        HStack {
                            VStack {
                                Image(systemName: like)
                                    .foregroundColor(forColor1)
                                Text("Like")
                                    .font(.caption)
                                    .padding(5)
                                    .frame(width: 65)
                                    .foregroundColor(Color.black.opacity(0.7))
                            }
                                .onTapGesture {
                                    if like == "hand.thumbsup"{
                                    like = "hand.thumbsup.fill"
                                        forColor1 = Color.green
                                        dislike = "hand.thumbsdown"
                                        forColor2 = Color.black.opacity(0.7)
                                    }
                                    else {
                                        like = "hand.thumbsup"
                                        forColor1 = Color.black.opacity(0.7)
                                    }
                                }
                            
                            
                            VStack {
                                Image(systemName: dislike)
                                    .foregroundColor(forColor2)

                                Text("disLike")
                                    .font(.caption)
                                    .padding(5)
                                    .frame(width: 65)
                                    .foregroundColor(Color.black.opacity(0.7))

                            }
                            .onTapGesture {
                                if dislike == "hand.thumbsdown"{
                                dislike = "hand.thumbsdown.fill"
                                    forColor2 = Color.red
                                    like = "hand.thumbsup"
                                    forColor1 = Color.black.opacity(0.7)
                                }
                                else {
                                    dislike = "hand.thumbsdown"
                                    forColor2 = Color.black.opacity(0.7)
                                }
                            }
                            
                            VStack {
                                Image(systemName: download)
                                    .foregroundColor(forColor3)

                                Text("download")
                                    .font(.caption)
                                    .padding(5)
                                    .frame(width: 65)
                            }
                            VStack {
                                Image(systemName: share)
                                    .foregroundColor(forColor4)

                                Text("Share")
                                    .font(.caption)
                                    .padding(5)
                                    .frame(width: 65)
                                    .foregroundColor(Color.black.opacity(0.7))

                            }
                            VStack {
                                Image(systemName: save)                                    .foregroundColor(forColor5)

                                Text("Save")
                                    .font(.caption)
                                    .padding(5)
                                    .frame(width: 65)
                                    .foregroundColor(Color.black.opacity(0.7))

                            }
                        }.padding()
                        
                        Divider()
                        
                        HStack{
                            Text("Comments")
                                .font(.headline)
                                Spacer()
                        }.padding()
                        HStack{
                            Image("profilepic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            TextField("Add a comment ....",text: $comments.comment)
                                .padding(10)
                                .background(.gray.opacity(0.1))
                                .cornerRadius(5)
                            
                            Button {
                                commentsArray.insert(comments, at: 0)
                                
                            } label: {
                                Text("Add")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 64, height: 40)
                                    .background(Color("Color1"))
                                    .cornerRadius(10)
                            }

                                
                        }.padding()
                        VStack{
                            ScrollView{
                                
                                ForEach(commentsArray, id: \.self){
                                    comment in
                                    
                                    Divider()
                                    HStack{
                                        Image(comments.profilepic)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                        
                                        Text(comments.comment)
                                            .font(.caption)
                                            .padding(10)
                                        
                                            Spacer()
                                    }.padding(.top,20)
                                    .padding(.horizontal)
                                    Divider()
                                        .padding(.top)
                                        .padding(.horizontal)
                                    
                                }
                            }
                        }
                        
                    }
                    
                }
            }
            
            
        }
    }
}

struct vidSheet_Previews: PreviewProvider {
    static var previews: some View {
        academyVideos(videos: [vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("Ananas"), vidTitle: "whateverr")])
//            commentsArray: [], comments: commentModel(comment: "")
        
    }
}


struct commentModel : Hashable {
    
    var id = UUID()
    
    var comment : String
    var profilepic : String = "profilepic"
}

struct vidModel : Identifiable {
    
    var id = UUID()
    var vidURL : String
    var vidImage : Image
    var vidTitle : String
    
}

var videoCollection =
[
    vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump1"), vidTitle: "1. everything you need to know about business and startup basics"),

    vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump2"), vidTitle: "2. Business Ideas that Will Be BIG in 2022"),
    
    vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump3"), vidTitle: "3. Business Planning course"),
    
    vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump4"), vidTitle: "4. How to make videos for business"),
    
    vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump5"), vidTitle: "5. understanding entrepreneurship basics and fundamentals")

]


