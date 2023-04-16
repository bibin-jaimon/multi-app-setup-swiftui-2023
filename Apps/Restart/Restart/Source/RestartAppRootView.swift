//
//  ContentView.swift
//  Restart
//
//  Created by Jaimon, Bibin on 09/04/23.
//

import SwiftUI

public struct RestartAppRootView: View {
    @AppStorage("onboarding") var isOnboardingScreenActive: Bool = true
    public var body: some View {
        ZStack {
            if isOnboardingScreenActive {
                OnboardingScreen()
            } else {
                HomeScreen()
            }
        }
    }
    
    public init() { }
}

struct RestartAppRootView_Previews: PreviewProvider {
    static var previews: some View {
        RestartAppRootView()
    }
}
