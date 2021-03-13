//
//  ExternalLinkView.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/10/21.
//  
//

import SwiftUI

struct ExternalLinkView: View {
    // MARK: - PROPERTIES

    let animal: Animal
    
    // MARK: - BODY

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!) {
                        HStack {
                            Image(systemName: "arrow.up.right.square")
                            Text(animal.name)
                        } //: HSTACK
                    } //: LINK
                } //: GROUP
            } //: HSTACK
        } //: GROUPBOX
    }
}

// MARK: - PREVIEW

struct ExternalLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalLinkView(animal: Animal.previewExample)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
