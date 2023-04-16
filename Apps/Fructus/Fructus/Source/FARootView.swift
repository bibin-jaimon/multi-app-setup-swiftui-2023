//
//  ContentView.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 16/04/23.
//

import SwiftUI

struct FARootView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct FARootView_Previews: PreviewProvider {
    static var previews: some View {
        FARootView()
    }
}
