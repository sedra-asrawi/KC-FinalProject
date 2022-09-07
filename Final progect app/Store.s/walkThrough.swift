//
//  walkThrough.swift
//  Store.s
//
//  Created by Sedra Asrawi on 06/09/2022.
//


import SwiftUI

// This project will work for iOS 14 also.....
struct walkThrough: View {
    
    @State var dotState: DotState = .normal

    @State var dotScale: CGFloat = 1
    

    @State var dotRotation: Double = 0
    

    @State var isAnimating = false
    
    var body: some View {
        
        ZStack{
            
            
            ZStack{
                

                (dotState == .normal ? Color("Color2") : Color("Color4"))
                
                if dotState == .normal{
                    MinimisedView()
                }
                else{
                    ExpandedView()
                }
            }
            .animation(.none, value: dotState)
            
            Rectangle()
                .fill(dotState != .normal ? Color("Color2") : Color("Color4"))
                .overlay(
                
                    ZStack{
                        

                        
                        
                        if dotState != .normal{
                            MinimisedView()
                        }
                        else{
                            ExpandedView()
                        }
                    }
                )
                .animation(.none, value: dotState)

                .mask(
                
                    GeometryReader{proxy in
                        
                        Circle()

                            .frame(width: 100, height: 100)
                            .scaleEffect(dotScale)
                            .rotation3DEffect(.init(degrees: dotRotation), axis: (x: 0, y: 1, z: 0), anchorZ: dotState == .flipped ? -10 : 10, perspective: 1)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                            .offset(y: -60)
                    }
                )
            

            Circle()
                .foregroundColor(Color.black.opacity(0.01))
                .frame(width: 100, height: 100)

                .overlay(
                
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .foregroundColor(.white)

                        .opacity(isAnimating ? 0 : 1)
                        .animation(.easeInOut(duration: 0.4), value: isAnimating)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .onTapGesture(perform: {
                    
                    if isAnimating{return}
                    
                    isAnimating = true
                    

                    if dotState == .flipped{
                        
                        

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.725) {
                            

                            withAnimation(.linear(duration: 0.7)){
                                dotScale = 1
                                dotState = .normal
                            }
                        }
                        
                        withAnimation(.linear(duration: 1.5)){
                            dotRotation = 0
                            dotScale = 8
                        }
                    }
                    else{
                        

                        

                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.725) {
                            

                            withAnimation(.linear(duration: 0.7)){
                                dotScale = 1
                                dotState = .flipped
                            }
                        }
                        
                        withAnimation(.linear(duration: 1.5)){
                            dotRotation = -180
                            dotScale = 8
                        }
                    }
                    

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                        isAnimating = false
                    }
                })
                .offset(y: -60)
            
        }
        .ignoresSafeArea()
    }
    

    
    @ViewBuilder
    func MinimisedView()->some View{
        
        VStack(spacing: 10){
            
            NavigationLink {
                startView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack {
                    Spacer()
                    Text("Skip")
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding(.horizontal)
            }

            
            Image("6")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding(.bottom,15)
            
            HStack {
                Text("Shop !")
                    .font(.system(size: 38).bold())
                Spacer()
            }.padding(.horizontal)
            
            HStack {
                Text("from different Businesses")
                    .font(.system(size: 46))
                    .fontWeight(.heavy)
                Spacer()
            }.padding(.horizontal)
            
            HStack {
                Text("unlimited shopping from your favorite businesses and great deals !")
                    .font(.system(size: 15).bold())
                Spacer()
            }.padding(.horizontal)
            
            Spacer()
        }.frame(height: 700)
        .foregroundColor(.white)
    }
    
    @ViewBuilder
    func ExpandedView()->some View{
        
        VStack(spacing: 10){
            
            NavigationLink {
                startView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack {
                    Spacer()
                    Text("Skip")
                        .foregroundColor(.white)
                        .font(.headline)
                }.padding(.horizontal)
            }
            
            Image("7")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding(.bottom,45)
            
            HStack {
                Text("Run Your Business")
                    .font(.system(size: 38).bold())
                Spacer()
            }.padding(.horizontal)
            
            HStack {
                Text("as a master 😎")
                    .font(.system(size: 46))
                    .fontWeight(.heavy)
                Spacer()
            }.padding(.horizontal)
            
            HStack {
                Text("communicate with your customers and share products with them.")
                    .font(.system(size: 15).bold())
                Spacer()
            }.padding(.horizontal)
            
            Spacer()
        }.frame(height: 700)
        .foregroundColor(.white)
    }
    

}

struct walkThrough_Previews: PreviewProvider {
    static var previews: some View {
        walkThrough()
    }
}

// Enum for current Dot State...
enum DotState{
    case normal
    case flipped
}



