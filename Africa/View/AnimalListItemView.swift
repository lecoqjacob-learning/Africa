//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/10/21.
//  
//

import SwiftUI

struct AnimalListItemView: View {
    // MARK: - PROPERTIES
    
    var animal: Animal

    // MARK: - BODY

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            } //: VSTACK
        } //: HSTACK
    }
}

// MARK: - PREVIEW

struct AnimalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListItemView(animal: Animal.previewExample)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
