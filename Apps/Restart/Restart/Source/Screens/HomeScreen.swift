//
//  HomeScreen.swift
//  restart-app
//
//  Created by Jaimon, Bibin on 02/02/23.
//

import SwiftUI
import AVFoundation
import ElementsPluginAPI

var avPlayer: AVAudioPlayer?
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            avPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            avPlayer?.play()
        } catch {
            
        }
    } else {
        print("Restart: No sound file found")
    }
}

public struct HomeScreen: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating: Bool = false
    public var body: some View {
        
        VStack {

            Spacer()
            
            ZStack {
                CircleGroupView(color: .gray)
                
                Image("character-2", bundle: Bundle.main)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation.easeOut(duration: 4).repeatForever(),
                        value: isAnimating
                    )
                
            }
            
            Text("The that leads to mastery is depended on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Button  {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart")
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        }

    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
