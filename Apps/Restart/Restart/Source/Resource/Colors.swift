//
//  Colors.swift
//  restart-app
//
//  Created by Jaimon, Bibin on 18/02/23.
//

import Foundation
import SwiftUI

enum RAColors: String {
    case colorBlue = "colorBlue"
    case colorRed = "colorRed"
}

extension Color {
    init(_ kRAType: RAColors) {
        self.init(kRAType.rawValue)
    }
}
