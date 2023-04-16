//
//  PinchAssets.swift
//  Pinch
//
//  Created by Jaimon, Bibin on 09/04/23.
//

import Foundation
import SwiftUI

struct PinchAssets {
    static var magazineFrontCover: Image {
        return Image("magazine-front-cover")
    }
    
    static func getImage(name: String) -> Image {
        return Image(name)
    }
}

