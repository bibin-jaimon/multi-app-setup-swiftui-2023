//
//  OnboardingScreen.swift
//  restart-app
//
//  Created by Jaimon, Bibin on 02/02/23.
//

import SwiftUI
import ElementsPluginAPI
import StringsPluginAPI

public struct OnboardingScreen: View {
    let buttonWidth: CGFloat = UIScreen.main.bounds.width - 80
    
    @AppStorage("onboarding") var isOnboardingViewActive = false
    
    @State var buttonOffset: CGFloat = 0
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: CGFloat = 1
    @State private var titleText: String = RestartAppConstants.onBoardingHeading
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    public var body: some View {
        ZStack {
            Color(.colorBlue)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TopTitle
                CenterImageContainer
                Slider(dataSource: self)
            }
        }.onAppear {
            isAnimating = true
        }.preferredColorScheme(.dark)
        
    }
}
extension OnboardingScreen {
    
    private var TopTitle: some View {
        return VStack {
            Text(titleText)
                .font(.system(size: 60))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .transition(.opacity)
                .id(titleText)
            
            Text(RestartAppConstants.onBoardingDescription)
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: isAnimating)
        
    }
    private var horizontalDragGesture: some Gesture {
        DragGesture()
            .onChanged { gesture in
                if abs(imageOffset.width) < 150 {
                    imageOffset = gesture.translation
                }
                withAnimation(.linear(duration: 0.25)) {
                    indicatorOpacity = 0
                }
                titleText = "Give."
            }.onEnded { _ in
                imageOffset = .zero
                withAnimation(.linear(duration: 0.25)) {
                    indicatorOpacity = 1
                }
                titleText = RestartAppAssets.Strigns.onBoardingHeading.rawValue
            }
    }
    
    private var arrowLeftNRightOverlay: some View {
        Image(systemName: "arrow.left.and.right.circle")
            .font(.system(size: 44, weight: .ultraLight))
            .foregroundColor(.white)
            .offset(y: 20)
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
            .opacity(indicatorOpacity)
    }
    
    private var CenterImageContainer: some View {
        ZStack {
            CircleGroupView(color: .white)
                .offset(x: imageOffset.width * -1, y: 0)
                .blur(radius: abs(imageOffset.width / 5))
                .animation(.easeOut(duration: 1), value: imageOffset)
            
            Image("character-1")
                .resizable()
                .scaledToFit()
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 0.5), value: isAnimating)
                .offset(x: imageOffset.width * 1.2, y: 0)
                .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                .gesture(horizontalDragGesture)
                .animation(.easeOut(duration: 1), value: imageOffset)
                .overlay(
                    arrowLeftNRightOverlay,
                    alignment: .bottom
                )
        }
    }
}

extension OnboardingScreen: SliderDataSource {
    public var capsuleColor: Color {
        Color(.colorBlue)
    }
    
    public var accentColor: Color {
        Color(.colorRed)
    }
    
    public var buttonText: String {
        "Get Started"
    }
    
    public var sliderImage: String {
        "chevron.right.2"
    }
    
    public var sliderWidth: CGFloat {
        buttonWidth
    }
    
    public func onEndedSliding(buttonOffset: CGFloat, buttonWidth: CGFloat) {
        if buttonOffset > buttonWidth / 2 {
            hapticFeedback.notificationOccurred(.success)
            playSound(sound: "chimeup", type: "mp3")
            isOnboardingViewActive = false
        } else {
            hapticFeedback.notificationOccurred(.warning)
        }
    }
    
    
}

extension OnboardingScreen {
    func canDragButton() -> Bool {
        if buttonOffset <= buttonWidth - 80 {
            return true
        }
        return false
    }
    
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
