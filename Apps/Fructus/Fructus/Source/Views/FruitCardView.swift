//
//  FruitCardView.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 16/04/23.
//

import SwiftUI

public struct FruitCardView: View {
    private let shadow: Color = Color(red: 0, green: 0, blue: 0, opacity: 0.15)
    private let fruit: Fruit
    
    // State
    @State private var isAnimating: Bool = false
    
    //AppStorage
    @AppStorage(AppStorageKeys.isOnboarded) var isOnboarded: Bool?
    
    private var topImageBanner: some View {
        Image(fruit.image)
            .resizable()
            .scaledToFit()
            .shadow(color: shadow, radius: 8, x: 6, y: 8)
            .scaleEffect(isAnimating ? 1.0 : 0.6)
    }
    
    private var title: some View {
        Text(fruit.title)
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .shadow(color: shadow,
                    radius: 2, x: 2, y: 2)
    }
    
    private var headLine: some View {
        Text(fruit.headline)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
            .frame(maxWidth: 480)
    }
    
    private var bottomButton: some View {
        Button {
            isOnboarded = true
        } label: {
            HStack(spacing: 8) {
                Text(FAStrings.start)
                Image(systemName: ImageNames.arrowRightCircle)
                    .imageScale(.large)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 1.25)
            )
        }
    }
    
    private var cardBackground: some View {
        LinearGradient(
            colors: fruit.gradientColors,
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    public var body: some View {
        ZStack {
            VStack {
                topImageBanner
                title
                headLine
                bottomButton
                    .accentColor(.white)
                    .padding()
                
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
        .background(cardBackground)
        .cornerRadius(20)
        .padding(.horizontal, 16)
    }
    
    public init(fruit: Fruit) {
        self.fruit = fruit
    }
}

struct FruitCardView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        FruitCardView(fruit: getFruitMockData()[5])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
