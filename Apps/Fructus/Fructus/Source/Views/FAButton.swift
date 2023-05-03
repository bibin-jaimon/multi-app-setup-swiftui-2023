//
//  FAButton.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 30/04/23.
//

import SwiftUI

struct FAButton: View {
    let imageName: String
    let handler: (() -> Void)?

    var body: some View {
        Button {
            handler?()
        } label: {
            Image(systemName: imageName)
        }
    }
    
    init(imageName: String, handler: (() -> Void)?) {
        self.handler = handler
        self.imageName = imageName
    }
}

struct FAButton_Previews: PreviewProvider {
    static var previews: some View {
        FAButton(imageName: "arrow.right", handler: nil)
    }
}
