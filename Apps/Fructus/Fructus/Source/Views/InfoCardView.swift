//
//  InfoCardView.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 30/04/23.
//

import SwiftUI

protocol InfoCardViewDataSource {
    var leftImage: String? { get }
    var leftText: String { get }
    var rightText: String { get }
    var rightImage: String? { get }
}

protocol InfoCardViewStyleDataSource {
    associatedtype V: ViewModifier
    
    var leftImageModifiers: V { get }
}

extension InfoCardViewStyleDataSource {
    var leftImageModifiers: V {
        EmptyModifier() as! Self.V
    }
}

extension InfoCardViewDataSource {
    var leftImage: String? { nil }
    var rightImage: String? { nil }
}

struct InfoCardView<V>: View where V: InfoCardViewStyleDataSource {
    
    let dataSource: InfoCardViewDataSource
    let modifiers: V?
    
    private var leftImageModifiers: some ViewModifier {
//        if let modifier = modifiers {
//            return modifier.leftImageModifiers
//        }
        return EmptyModifier()
    }
    
    private var leftImageView: some View {
        Image(systemName: dataSource.leftImage ?? "")
            .modifier(leftImageModifiers)
    }
    
    var body: some View {
        GroupBox() {
            HStack {
                leftImageView
                Text(dataSource.leftText)
                Spacer()
                Text(dataSource.rightText)
                if let image = dataSource.rightImage {
                    Image(systemName: image)
                }
            }
        }
    }
    
    init (dataSource: InfoCardViewDataSource, modifiers: V) {
        self.dataSource = dataSource
        self.modifiers = modifiers
    }
    
    init (dataSource: InfoCardViewDataSource) {
        self.dataSource = dataSource
        self.modifiers = nil
    }
    
}

struct InfoCardView_Previews: PreviewProvider {
    struct MockData: InfoCardViewDataSource {
        var leftImage: String? { "info.circle" }
        var leftText: String { "LeftMock" }
        var rightText: String { "RightMock" }
        var rightImage: String? { "arrow.up.right.square" }
    }
    
    struct MockLeftImageViewModifier: ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.green)
        }
    }
    
    struct MockInfoCardViewStyleDataSource: InfoCardViewStyleDataSource {
        var leftImageModifiers: some ViewModifier {
            MockLeftImageViewModifier()
        }
    }
    
    static var previews: some View {
        VStack {
            InfoCardView(dataSource: MockData(),
                         modifiers: MockInfoCardViewStyleDataSource())
//            InfoCardView(dataSource: MockData())
            InfoCardView(dataSource: MockData(),
                         modifiers: MockInfoCardViewStyleDataSource())
        }
    }
}
