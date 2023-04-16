//
//  SwiftUIView.swift
//  
//
//  Created by Jaimon, Bibin on 23/03/23.
//

import SwiftUI

public struct DrawerView<Content: View>: View {
    
    @State private var isOpenDrawer: Bool = false
    var animating: Bool
    let content: Content
    
    var imageName: String {
        isOpenDrawer ? "chevron.compact.right" : "chevron.compact.left"
    }
    
    public var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(8)
                .foregroundStyle(.secondary)
                .onTapGesture(perform: {
                    withAnimation(.easeOut) {
                        isOpenDrawer.toggle()
                    }
                })
            content
                .opacity(isOpenDrawer ? 1 : 0)
                .animation(.easeOut(duration: 0.5), value: isOpenDrawer)
            Spacer()
        }
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .frame(width: 260)
        .offset(x: isOpenDrawer ? 20 : 215)
    }
    
    public init(animating: Bool, @ViewBuilder content: () -> Content) {
        self.animating = animating
        self.content = content()
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerView(animating: true) {
            Text("RenderIt")
        }
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        
    }
}
