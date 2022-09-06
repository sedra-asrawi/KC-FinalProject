//
//  ddd.swift
//  Store.s
//
//  Created by Sedra Asrawi on 02/09/2022.
//

import SwiftUI
import AVKit

struct customTabBar: View {
    
    
    
    var body: some View {

        Homey()
             

    }
}

struct customTabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        customTabBar()
    }
}

struct Homey: View {
    
    @State var selectedtab = "playtv"
    
    init() {

        UITabBar.appearance().isHidden = true
    }
    
    @State var selction : String = "playtv"
    

    @State var xAxis: CGFloat = 0
    
    @Namespace var animation
    
    @State var videoCollection =
    [
        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump1"), vidTitle: "1. everything you need to know about business and startup basics"),

        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump2"), vidTitle: "2. Business Ideas that Will Be BIG in 2022"),
        
        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump3"), vidTitle: "3. Business Planning course"),
        
        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump4"), vidTitle: "4. How to make videos for business"),
        
        vidModel(vidURL: "https://bit.ly/swswift", vidImage: Image("thump5"), vidTitle: "5. understanding entrepreneurship basics and fundamentals")

    ]
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedtab){
                
                academyVideos(videos: videoCollection, videoCollection: videoCollection)
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("playtv")
                
                academyArticles()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("chart.bar.doc.horizontal")
                
                academyGames()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("gamecontroller.fill")
                
                academyLessons()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("video.bubble.left")
                
                academyHelp()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("questionmark.circle.fill")
            }
            

            
            HStack(spacing: 0){
                
                ForEach(tabs,id: \.self){image in
                    
                    GeometryReader {reader in
                        Button(action: {
                            withAnimation(.spring()){
                                selectedtab = image
                                xAxis = reader.frame(in: .global).minX
                            }
                        }, label: {
                            
                            Image(image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(selectedtab == image ? getColor(image: image) : Color(.gray).opacity(0.6))
                                .padding(selectedtab == image ? 15 : 0)
                                .background(Color("Color3")
                                    .opacity(selectedtab == image ? 1 : 0).clipShape(Circle()))
                                .matchedGeometryEffect(id: image, in: animation)
                                .offset(x: selectedtab == image ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX) : 0,y: selectedtab == image ? -50 : 0)
                            
                        })
                        .onAppear(perform: {
                            
                            if image == tabs.first{
                                xAxis = reader.frame(in: .global).minX
                            }
                        })
                    }
                    .frame(width: 25, height: 30)
                    
                    if image != tabs.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .background(Color("Color3").clipShape(CustomShape(xAxis: xAxis)).cornerRadius(12))
            .padding(.horizontal)

            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)

        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    

    
    func getColor(image: String)->Color{
        
        switch image {
        case "playtv":
            return Color.white
        case "chart.bar.doc.horizontal":
            return Color.white
        case "gamecontroller.fill":
            return Color.white
        case "video.bubble.left":
            return Color.white
        default:
            return Color.white
        }
    }
}

var tabs = [
    
    "playtv","chart.bar.doc.horizontal","gamecontroller.fill","video.bubble.left","questionmark.circle.fill"]



struct CustomShape: Shape {
    
    var xAxis: CGFloat
    

    
    var animatableData: CGFloat{
        get{return xAxis}
        set{xAxis = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x: center - 50, y: 0))
            
            let to1 = CGPoint(x: center, y: 35)
            let control1 = CGPoint(x: center - 25, y: 0)
            let control2 = CGPoint(x: center - 25, y: 35)
            
            let to2 = CGPoint(x: center + 50, y: 0)
            let control3 = CGPoint(x: center + 25, y: 35)
            let control4 = CGPoint(x: center + 25, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}
