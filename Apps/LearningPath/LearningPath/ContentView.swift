//
//  ContentView.swift
//  LearningPath
//
//  Created by Jaimon, Bibin on 05/04/23.
//

import SwiftUI
import RestartSDK
import PinchFramework

enum Apps: String {
    case restartApp = "Restart App"
    case pinch = "Pinch App"
}

struct ListData: Identifiable {
    let id = UUID()
    let app: Apps
}

struct ContentView: View {
    
    private let apps: [ListData] = [
        ListData(app: .restartApp),
        ListData(app: .pinch)
    ]

    var body: some View {
        NavigationView {
            List(apps) { item in
                NavigationLink {
                    if item.app == .restartApp {
                        RestartAppRootView()
                    } else if item.app == .pinch {
                        HomeScreen()
                    }
                } label: {
                    HStack {
                        Image(systemName: "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                        Text(item.app.rawValue)
                    }
                    .frame(height: 100)
                }
            }
            .navigationTitle("AppZ")
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
