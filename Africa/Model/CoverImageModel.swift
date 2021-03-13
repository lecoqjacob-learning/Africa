//
//  CoverImageModel.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/10/21.
//

import Foundation

struct CoverImage: Codable, Identifiable {
    let id: Int
    let name: String
}

extension CoverImage {
    static let allCoverImages: [CoverImage] = Bundle.main.decode("covers.json")
    static let previewExample = allCoverImages[0]
}
