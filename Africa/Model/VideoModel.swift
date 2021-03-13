//
//  VideoModel.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/11/21.
//  
//

import SwiftUI

struct Video: Codable, Identifiable {
    // MARK: - PROPERTIES

    let id: String
    let name: String
    let headline: String
    
    //Computed Propety
    var thumbnail: String {
        "video-\(id)"
    }
}

extension Video {
    static let allVideos: [Video] = Bundle.main.decode("videos.json")
    static let previewExample = allVideos[0]
}
