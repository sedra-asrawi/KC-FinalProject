//
//  ReelsView.swift
//  Store.s
//
//  Created by Sedra Asrawi on 06/09/2022.
//

import SwiftUI
import AVKit

struct ReelsView: View {
    
    @State var currentReel = ""
    

    @State var reels = MediaFileJSON.map { item -> Reel in
        
        let url = Bundle.main.path(forResource: item.url, ofType: "mp4") ?? ""
        
        let player = AVPlayer(url: URL(fileURLWithPath: url))
        
        return Reel(player: player, mediaFile: item)
    }
    
    var body: some View {
        

        GeometryReader{proxy in
            
            let size = proxy.size
            

            TabView(selection: $currentReel){
                
                ForEach($reels){$reel in
                    
                    ReelsPlayer(reel: $reel, currentReel: $currentReel)

                    .frame(width: size.width)

                    .rotationEffect(.init(degrees: -90))
                    .ignoresSafeArea(.all, edges: .top)
                    .tag(reel.id)
                }
            }

            .rotationEffect(.init(degrees: 90))

            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))

            .frame(width: size.width)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.ignoresSafeArea())

        .onAppear {
            currentReel = reels.first?.id ?? ""
        }
    }
}

struct ReelsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ReelsPlayer: View{
    
    @Binding var reel: Reel
    
    @Binding var currentReel: String
    

    @State var showMore = false
    
    @State var isMuted = false
    @State var volumeAnimation = false
    
    var body: some View{
        
        ZStack{
            

            if let player = reel.player{
                
                CustomVideoPlayer(player: player)
                

                
                GeometryReader{proxy -> Color in
                    
                    let minY = proxy.frame(in: .global).minY
                    
                    let size = proxy.size
                    
                    DispatchQueue.main.async {
                        


                        
                        if -minY < (size.height / 2) && minY < (size.height / 2) && currentReel == reel.id{
                            
                            player.play()
                        }
                        else{
                            player.pause()
                        }
                    }
                    
                    return Color.clear
                }
                
                

                
                
                Color.black
                    .opacity(0.01)
                    .frame(width: 150, height: 150)
                    .onTapGesture {
                        if volumeAnimation{
                            return
                        }
                        
                        isMuted.toggle()

                        player.isMuted = isMuted
                        withAnimation{volumeAnimation.toggle()}
                        

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            
                            withAnimation{volumeAnimation.toggle()}
                        }
                    }
                

                Color.black.opacity(showMore ? 0.35 : 0)
                    .onTapGesture {

                        withAnimation{showMore.toggle()}
                    }
                
                VStack{
                    
                    HStack(alignment: .bottom){
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            HStack(spacing: 15){
                                
                                Image("profilepic")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                
                                Text("User")
                                    .font(.callout.bold())
                                
                                Button {
                                    
                                } label: {
                                    Text("Follow")
                                        .font(.caption.bold())
                                }

                            }
                            

                            
                            ZStack{
                                
                                if showMore{
                                    
                                    ScrollView(.vertical, showsIndicators: false) {
                                        

                                        Text(reel.mediaFile.title + sampleText)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                    }
                                    .frame(height: 120)
                                    .onTapGesture {
                                        withAnimation{showMore.toggle()}
                                    }
                                }
                                else{
                                    
                                    Button {
                                        
                                        withAnimation{showMore.toggle()}
                                        
                                    } label: {
                                        
                                        HStack{
                                            
                                            Text(reel.mediaFile.title)
                                                .font(.callout)
                                                .fontWeight(.semibold)
                                                .lineLimit(1)
                                            
                                            Text("more")
                                                .font(.callout.bold())
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.top,6)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }

                                }
                            }
                        }
                        
                        Spacer(minLength: 20)
                        

                        
                        ActionButtons(reel: reel)
                    }
                    

                    HStack{
                        
                        Text("A Sky full of Stars")
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        Spacer(minLength: 20)
                        
                        Image("song")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .cornerRadius(6)
                            .background(
                            
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.white,lineWidth: 3)
                            )
                            .offset(x: -5)
                    }
                    .padding(.top,10)
                }
                .padding(.horizontal)
                .padding(.bottom,20)
                .foregroundColor(.white)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(.secondary)
                    .clipShape(Circle())
                    .foregroundStyle(.black)
                    .opacity(volumeAnimation ? 1 : 0)
            }
        }
    }
}

struct ActionButtons: View{
    var reel: Reel
    
    var body: some View{
        
        VStack(spacing: 25){
            
            Button {
                
            } label: {
                VStack(spacing: 10){
                    
                    Image(systemName: "suit.heart")
                        .font(.title)
                    
                    Text("233K")
                        .font(.caption.bold())
                }
            }
            
            Button {
                
            } label: {
                VStack(spacing: 10){
                    
                    Image(systemName: "bubble.right")
                        .font(.title)
                    
                    Text("120")
                        .font(.caption.bold())
                }
            }
            
            Button {
                
            } label: {
                VStack(spacing: 10){
                    
                    Image(systemName: "paperplane")
                        .font(.title)
                }
            }
            
            Button {
                
            } label: {
                Image("menu")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .rotationEffect(.init(degrees: 90))
            }


        }
    }
}


let sampleText = "......"
