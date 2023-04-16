//
//  ContentView.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 16/04/23.
//

import SwiftUI

public struct FARootView: View {
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    
    public init() { }
}

struct FARootView_Previews: PreviewProvider {
    static var previews: some View {
        FARootView()
    }
}
