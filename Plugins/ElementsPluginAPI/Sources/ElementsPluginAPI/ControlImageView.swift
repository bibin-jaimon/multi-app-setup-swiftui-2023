//
//  SwiftUIView.swift
//  
//
//  Created by Jaimon, Bibin on 22/03/23.
//

import SwiftUI

public struct ControlImageView: View {
    let icon: String
    public var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
    
    public init(icon: String) {
        self.icon = icon
    }
}

public struct ControlImageViewButton: View {
    let controlImageView: ControlImageView
    let handler: () -> Void
    
    public var body: some View {
        Button {
            handler()
        } label: {
            controlImageView
        }
    }
    
    public init(controlImageView: ControlImageView, _ handler: @escaping () -> Void) {
        self.controlImageView = controlImageView
        self.handler = handler
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
