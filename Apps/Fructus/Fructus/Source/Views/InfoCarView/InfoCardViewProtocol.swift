//
//  InfoCardViewProtocol.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 30/04/23.
//

import Foundation
import SwiftUI

protocol InfoCardViewDataSource {
    var leftImage: String? { get }
    var leftText: String { get }
    var rightText: String { get }
    var rightImage: String? { get }
}

extension InfoCardViewDataSource {
    var leftImage: String? { nil }
    var rightImage: String? { nil }
}

/// Style Data Source
protocol InfoCardViewStyleDataSource {
    associatedtype V: ViewModifier
    associatedtype T: ViewModifier
    associatedtype X: ViewModifier
    associatedtype Y: ViewModifier
    
    var leftImageModifiers: V { get }
    var leftTextModifiers: T { get }
    var rightTextModifiers: X { get }
    var rightImageModifiers: Y { get }
}

extension InfoCardViewStyleDataSource {
    var leftImageModifiers: V {
        EmptyModifier() as! Self.V
    }
}


