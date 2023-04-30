//
//  FAOnboardingScreen.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 17/04/23.
//

import SwiftUI

struct FAOnboardingScreen: View {
    let fruits: [Fruit] = getFruitMockData()
    
    var body: some View {
        TabView {
            ForEach(fruits[0...3]) { item in
                FruitCardView(fruit: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

struct FAOnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        FAOnboardingScreen()
    }
}
