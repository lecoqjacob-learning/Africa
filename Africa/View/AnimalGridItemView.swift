//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/12/21.
//  
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - PROPERTIES

    let animal: Animal
    
    // MARK: - BODY

    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

// MARK: - PREVIEW

struct AnimalGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalGridItemView(animal: Animal.previewExample)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
