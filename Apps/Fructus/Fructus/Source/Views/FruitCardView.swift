//
//  FruitCardView.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 16/04/23.
//

import SwiftUI

public struct FruitCardView: View {
    private let imageShadow: Color = Color(red: 0, green: 0, blue: 0, opacity: 0.15)
    @State private var isAnimating: Bool = false
    
    public var body: some View {
        ZStack {
            VStack {
                
                Image("blueberry")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: imageShadow, radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                Text("Blueberry")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15),
                            radius: 2, x: 2, y: 2)
                
                Text("Blueberries are sweet, nutritious and wildy popular fruit all over the world")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                Button {
                    
                } label: {
                    HStack(spacing: 8) {
                        Text("Start")
                        Image(systemName: "arrow.right.circle")
                            .imageScale(.large)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .background(
                        Capsule().strokeBorder(.white, lineWidth: 1.25)
                    )
                }
                .accentColor(.white)

            } //: VStack
            .padding()
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .center)
        .background(
            LinearGradient(
                colors: [
                    Color("ColorBlueberryLight"),
                    Color("ColorBlueberryDark")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
    
    public init() { }
}

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView()
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
