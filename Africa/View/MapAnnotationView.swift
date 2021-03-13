//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/11/21.
//
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES

    @State private var animation: Double = 0.0
    @State private var show: Bool = false

    var location: NationalParkLocation

    // MARK: - BODY

    var body: some View {
        ZStack {
            if show {
                Text(location.name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                    .fixedSize(horizontal: true, vertical: true)
                    .offset(x:0, y: -45)
            }

            ZStack {
                Circle()
                    .fill(Color.accentColor)
                    .frame(width: 54, height: 54, alignment: .center)

                Circle()
                    .stroke(Color.accentColor, lineWidth: 2)
                    .frame(width: 52, height: 52, alignment: .center)
                    .scaleEffect(1 + CGFloat(animation))
                    .opacity(1 - animation)

                Image(location.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                    .clipShape(
                        Circle()
                    )
                    .onTapGesture {
                        withAnimation{
                            self.show.toggle()
                        }
                    }
            } //: ZSTACK
            .onAppear {
                withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                    animation = 1
                }
            }
        } //: VSTACK
    }
}

// MARK: - PREVIEW

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(location: NationalParkLocation.previewExample)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
