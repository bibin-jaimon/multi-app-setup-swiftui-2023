//
//  ContentView.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 16/04/23.
//

import SwiftUI

public struct FARootView: View {
    @AppStorage(AppStorageKeys.isOnboarded) var isOnboarded: Bool = false
    
    public var body: some View {
        if isOnboarded {
            FruitsListScreen(fruits: getFruitMockData())
        }  else {
            FAOnboardingScreen()
        }
        
    }
    
    public init() { }
}

struct FARootView_Previews: PreviewProvider {
    static var previews: some View {
        FARootView()
    }
}
