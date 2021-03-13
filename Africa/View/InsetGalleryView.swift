//
//  GalleryView.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/10/21.
//  
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - PROPERTIES

    let animal: Animal
    
    // MARK: - BODY

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack (alignment: .center, spacing: 15){
                ForEach(animal.gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            } //: HSTACK
        } //: SCROLL
    }
}

// MARK: - PREVIEW

struct InsetGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        InsetGalleryView(animal: Animal.previewExample)
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
