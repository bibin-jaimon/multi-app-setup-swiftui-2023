//
//  FAOnboardingScreen.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 17/04/23.
//

import SwiftUI

struct FAOnboardingScreen: View {
    var body: some View {
        TabView {
            ForEach(0 ..< 5) { item in
                FruitCardView()
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
