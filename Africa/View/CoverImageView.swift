//
//  CoverImageView.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/10/21.
//  
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    
    let coverImages: [CoverImage] = CoverImage.allCoverImages

    // MARK: - BODY

    var body: some View {
        TabView {
            ForEach(coverImages) { coverImage in
                Image(coverImage.name)
                    .resizable()
                    .scaledToFill()
            } //: FOREACH
        } //: TABVIEW
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
