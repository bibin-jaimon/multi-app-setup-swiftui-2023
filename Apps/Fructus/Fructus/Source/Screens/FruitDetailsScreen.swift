//
//  FruitDetailsScreen.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 29/04/23.
//

import SwiftUI

struct FruitDetailsScreen: View {
    let fruit: Fruit
    @State private var isAnimatingImageView: Bool = false
    
    
    var headerView: some View {
        ZStack {
            LinearGradient(colors: fruit.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: .white.opacity(0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimatingImageView ? 1.0 : 0.6)
        }
        .frame(height: 440)
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimatingImageView = true
            }
        }
    }
    
    var titleView: some View {
        Text(fruit.title)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(fruit.gradientColors.first)
    }
    
    var headLineView: some View {
        Text(fruit.headline)
            .font(.headline)
            .multilineTextAlignment(.leading)
    }
    
    var learnMoreView: some View {
        Text(FAStrings.learnMoreAbout(fruit.title).uppercased())
            .fontWeight(.bold)
            .foregroundColor(fruit.gradientColors.first)
    }
    
    var sourceLinkView: some View {
        GroupBox() {
            HStack {
                Text(FAStrings.contentSource)
                Spacer()
                Link(FAStrings.wikipedia, destination: URL(string: FALinks.wikipedia)!)
                Image(systemName: ImageNames.arrowUpRightSquare)
            }
        }
    }
    
    var descriptionView: some View {
        Text(fruit.description)
    }
    
    var nutrientView: some View {
        let nutrients: [String] = [
            "Energy",
            "Sugar",
            "Fat",
            "Protein",
            "Vitamins",
            "Minerals"
        ]

        return GroupBox() {
            DisclosureGroup(FAStrings.nutritionalValue) {
                ForEach(0..<nutrients.count, id: \.self) { index in
                    Divider().padding(.vertical, 2)
                    HStack {
                        
                        Group {
                            Image(systemName: ImageNames.infoCircle)
                            Text(nutrients[index])
                        }
                        .foregroundColor(fruit.gradientColors.first)
                        .font(.system(.body).bold())
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[index])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    headerView
                    VStack(alignment: .leading, spacing: 20) {
                        titleView
                        headLineView
                        nutrientView
                        learnMoreView
                        descriptionView
                        sourceLinkView
                        
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }
            }
            .navigationBarTitle(fruit.title, displayMode: .inline)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FruitDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailsScreen(fruit: getFruitMockData().shuffled()[0])
            .preferredColorScheme(.dark)
    }
}
