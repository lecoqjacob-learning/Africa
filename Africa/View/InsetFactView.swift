//
//  InsetFactView.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/10/21.
//  
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal

    // MARK: - BODY

    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
            } //: TABVIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GROUPBOX
    }
}

// MARK: - PREVIEW

struct InsetFactView_Previews: PreviewProvider {
    static var previews: some View {
        InsetFactView(animal: Animal.previewExample)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
