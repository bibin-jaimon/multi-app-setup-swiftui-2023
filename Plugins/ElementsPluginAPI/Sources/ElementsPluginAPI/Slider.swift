//
//  SwiftUIView.swift
//  
//
//  Created by Jaimon, Bibin on 09/04/23.
//
import SwiftUI

public protocol SliderDataSource {
    var buttonText: String { get }
    var sliderImage: String { get }
    var sliderWidth: CGFloat { get }
    var accentColor: Color { get }
    var capsuleColor: Color { get }
    
    func onEndedSliding(buttonOffset: CGFloat, buttonWidth: CGFloat)
}

public struct Slider: View {
    @State var buttonOffset: CGFloat = 0
    private let sliderWidth: CGFloat = 300
    private var dataSource: SliderDataSource
    
    public var body: some View {
        CapsuleContainer(width: sliderWidth,
                         accentColor: dataSource.capsuleColor) {
            
            Text(dataSource.buttonText)
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 20)
            
            // Fill back ground when sliding
            HStack {
                Capsule()
                    .fill(dataSource.accentColor)
                    .frame(width: buttonOffset + 80)

                Spacer()
            }
            
            HStack {
                MoverCircle(imageName: dataSource.sliderImage, accentColor: dataSource.accentColor)
                    .offset(x: buttonOffset)
                    .gesture(createDragGesture())
                Spacer()
            }
        }
    }
    
    public init(dataSource: SliderDataSource) {
        self.dataSource = dataSource
    }
}

private extension Slider {
    func MoverCircle(imageName: String, accentColor: Color) -> some View {
        ZStack {
            Circle()
                .fill(accentColor)
            
            Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
            
            Image(systemName: imageName)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
        }
    }
    
    private func createDragGesture() -> some Gesture {
        DragGesture()
            .onChanged { gesture in
                if gesture.translation.width > 0 && (buttonOffset <= sliderWidth - 80) {
                    buttonOffset = gesture.translation.width
                }

            }
            .onEnded { _ in
                withAnimation {
                    if buttonOffset > sliderWidth / 2 {
                        buttonOffset = sliderWidth - 80
                    } else {
                        buttonOffset = 0
                    }
                    dataSource.onEndedSliding(buttonOffset: buttonOffset, buttonWidth: sliderWidth)
                }
            }
    }
}

fileprivate struct CapsuleContainer<Child: View> : View {
    let width: CGFloat
    let height: CGFloat
    let accentColor: Color
    let children: () -> Child
    
    init(width: CGFloat = 300,
         height: CGFloat = 80,
         accentColor: Color,
         @ViewBuilder content: @escaping () -> Child) {
        self.children = content
        self.width = width
        self.height = height
        self.accentColor = accentColor
    }
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.white.opacity(0.2))
            
            Capsule()
                .fill(Color.white.opacity(0.2))
                .padding(8)

            children()

            
        }
        .frame(width: width, height: height, alignment: .center)
        .background(accentColor)
        .cornerRadius(height / 2)
        .padding()
    }
}

struct Slider_Previews: PreviewProvider {
    
    struct MockSliderDataSource: SliderDataSource {
        var capsuleColor: Color {
            Color(.green)
        }
        
        var accentColor: Color {
            Color(.systemRed)
        }
        
        func onEndedSliding(buttonOffset: CGFloat, buttonWidth: CGFloat) {
            print("Sliding ended")
        }
        
        var buttonText: String {
            "Get Started"
        }
        
        var sliderImage: String {
            "chevron.right.2"
        }
        
        var sliderWidth: CGFloat {
            300
        }
        
        
    }
    static var previews: some View {
        Slider(dataSource: MockSliderDataSource())
    }
}
