//
//  InfoCardModel.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 30/04/23.
//

import Foundation

struct InfoCardModel: Identifiable, InfoCardViewDataSource {
    var id = UUID()
    var leftText: String
    var rightText: String
    var rightImage: String?
    var leftImage: String?
}

extension InfoCardModel {
    static func getInfoCardViewData() -> [InfoCardModel] {
        return [
            InfoCardModel(leftText: "Developer", rightText: "Bibin Jaimon"),
            InfoCardModel(leftText: "Designer", rightText: "Bibin Jaimon"),
            InfoCardModel(leftText: "Website", rightText: "SwiftUI Masterclass", rightImage: "arrow.up.right.square"),
            InfoCardModel(leftText: "Twitter", rightText: "@bibinjaimon", rightImage: "arrow.up.right.square"),
            InfoCardModel(leftText: "Compatibility", rightText: "iOS 14.0"),
            InfoCardModel(leftText: "Version", rightText: "1.1.0"),
            InfoCardModel(leftText: "SwiftUI", rightText: "2.0")
            
        ]
    }
}
