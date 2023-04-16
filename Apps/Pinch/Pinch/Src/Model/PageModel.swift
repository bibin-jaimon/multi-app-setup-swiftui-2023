//
//  PageModel.swift
//  Pinch
//
//  Created by Jaimon, Bibin on 16/04/23.
//

import Foundation

struct PageModel: Identifiable {
    let id: Int
    let imageName: String
}

extension PageModel {
    var thumbImageName: String {
        return "thumb-\(imageName)"
    }
}

func createPageData() -> [PageModel] {
    return [
        PageModel(id: 0, imageName: "magazine-front-cover"),
        PageModel(id: 1, imageName: "magazine-back-cover")
    ]
}
