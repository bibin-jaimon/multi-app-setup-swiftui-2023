//
//  CircleGroupView.swift
//  restart-app
//
//  Created by Jaimon, Bibin on 03/02/23.
//

import SwiftUI

public struct CircleGroupView: View {
    @State var color: Color
    @State private var isAnimating = false

    public var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.2), lineWidth: 40)
            .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(color.opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
    
    public init(color: Color) {
        self.color = color
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("colorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(color: .white)
        }
    }
}
