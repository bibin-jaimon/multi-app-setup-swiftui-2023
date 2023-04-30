//
//  AppStorageManager.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 29/04/23.
//

import Foundation
import SwiftUI

class AppStorageManager {
    
    
    
    @AppStorage("appState") var appState: String = ""
    
    static let shared: AppStorageManager = AppStorageManager()
    
    private init() {
        
    }
    
    func getAppState() -> AppState {
        
        //Decode string
        
        let decoder = JSONDecoder()
        
        if let data = appState.data(using: .utf8), let instance = try? decoder.decode(AppState.self, from: data) {
            return instance
        }
        
        return AppState(isOnboarded: false)
    }
    
    func setAppState(_ state: AppState) {
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(state) {
            let stateString = String(data: data, encoding: .utf8)!
            appState = stateString
        } else {
            print("error")
        }
    }
    
}

protocol Preference: Codable {
    
}

struct AppState: Preference {
    var isOnboarded: Bool
}
