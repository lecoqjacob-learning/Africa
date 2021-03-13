//
//  GalleryView.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/10/21.
//
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    
    // Dynamic Grid Definition
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    let animals: [Animal] = Animal.allAnimals
    let hapticFeedBack = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK: SLIDER

                Slider(value: $gridColumn, in: 2 ... 4, step: 1).padding(.horizontal).onChange(of: gridColumn, perform: { _ in
                    gridSwitch()
                })
                
                // MARK: - GRID

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                self.selectedAnimal = animal.image
                                hapticFeedBack.impactOccurred()
                            }
                    }
                } //: LAZY VGRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                    hapticFeedBack.prepare()
                })
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

// MARK: - PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
