//
//  SwiftUIView.swift
//  
//
//  Created by Jaimon, Bibin on 23/03/23.
//

import SwiftUI

public struct DrawerView: View {
    
    @State private var isOpenDrawer: Bool = false
    var animating: Bool
    
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
            
            Spacer()
        }
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
        .background(.ultraThinMaterial)
        .cornerRadius(12)
//        .opacity(animating ? 1 : 0)
        .frame(width: 260)
        .offset(x: isOpenDrawer ? 20 : 215)
    }
    
    public init(animating: Bool) {
        self.animating = animating
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerView(animating: true)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
