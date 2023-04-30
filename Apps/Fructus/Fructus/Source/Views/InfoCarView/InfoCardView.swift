//
//  InfoCardView.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 30/04/23.
//

import SwiftUI

struct InfoCardView<Style>: View where Style: InfoCardViewStyleDataSource {
    
    let dataSource: InfoCardViewDataSource
    let modifiers: Style
    
    private var leftImageModifiers: some ViewModifier {
        modifiers.leftImageModifiers
    }
    
    private var leftTextModifiers: some ViewModifier {
        modifiers.leftTextModifiers
    }
    
    private var rightTextModifiers: some ViewModifier {
        modifiers.rightTextModifiers
    }
    
    private var rightImageModifiers: some ViewModifier {
        modifiers.rightImageModifiers
    }
    
    private var leftImageView: some View {
        Image(systemName: dataSource.leftImage ?? "")
            .modifier(leftImageModifiers)
    }
    
    private var leftTextView: some View {
        Text(dataSource.leftText)
            .modifier(leftTextModifiers)
    }
    
    private var rightTextView: some View {
        Text(dataSource.rightText)
            .modifier(rightTextModifiers)
    }
    
    private var rightImageView: (String) -> any View = { name in
        return Image(systemName: name)
    }
    
    init (dataSource: InfoCardViewDataSource, modifiers: Style) {
        self.dataSource = dataSource
        self.modifiers = modifiers
    }
    
    var body: some View {
        GroupBox() {
            HStack {
                leftImageView
                leftTextView
                Spacer()
                rightTextView
                if let image = dataSource.rightImage {
                    Image(systemName: image)
                        .modifier(rightImageModifiers)
                }
            }
        }
    }
    
}

struct InfoCardView_Previews: PreviewProvider {
    struct MockData: InfoCardViewDataSource {
        var leftImage: String? { "info.circle" }
        var leftText: String { "LeftMock" }
        var rightText: String { "RightMock" }
        var rightImage: String? { "arrow.up.right.square" }
    }
    
    struct MockImageViewModifier: ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.green)
                .font(.title)
        }
    }
    
    struct MockTextViewModifier: ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.green)
        }
    }
    
    struct MockInfoCardViewStyleDataSource: InfoCardViewStyleDataSource {
        var leftImageModifiers: some ViewModifier {
            MockImageViewModifier()
        }
        
        var leftTextModifiers: some ViewModifier {
            MockTextViewModifier()
        }
        
        var rightTextModifiers: some ViewModifier {
            MockTextViewModifier()
        }
        
        var rightImageModifiers: some ViewModifier {
            MockImageViewModifier()
        }
    }
    
    static var previews: some View {
        VStack {
            InfoCardView(dataSource: MockData(),
                         modifiers: MockInfoCardViewStyleDataSource())
        }
    }
}
