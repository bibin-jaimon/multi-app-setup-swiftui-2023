//
//  InfoCardViewConfiguration.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 30/04/23.
//

import Foundation
import SwiftUI


struct RightImageViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(.green)
    }
}

struct LeftTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(.green)
    }
}

struct RightTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(.green)
    }
}

//struct InfoCardViewStyle: InfoCardViewStyleDataSource {
//    
//    var leftTextModifiers: some ViewModifier {
//        LeftTextViewModifier()
//    }
//    
//    var RightTextViewModifier: some ViewModifier {
//        RightTextViewModifier()
//    }
//
//    var rightImageModifiers: some ViewModifier {
//        RightImageViewModifier()
//    }
//}
