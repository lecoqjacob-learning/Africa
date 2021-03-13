//
//  MapView.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/10/21.
//
//

import MapKit
import SwiftUI

struct MapView: View {
    // MARK: - PROPERTIES

    @State private var region: MKCoordinateRegion = {
        var mapCords = CLLocationCoordinate2D(latitude: 6.60286, longitude: 16.4377599)
        var mapZoom = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCords, span: mapZoom)

        return mapRegion
    }()

    let locations: [NationalParkLocation] = NationalParkLocation.allLocations

    // MARK: - BODY

    var body: some View {
        // Map(coordinateRegion: $region)

        // MARK: - - no2 map

        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // (A) PIN: OLD STYLE (always static)
//            MapPin(coordinate: item.location, tint: .accentColor)

            // (B) Marker: New Style (always static)
//            MapMarker(coordinate: item.location, tint: .accentColor)

            // (C) Custom Annotaion (could be interactive)
//            MapAnnotation(coordinate: item.location){
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            } //: ANNOTATION

            // (D) Complex Annotation (could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }) //: MAP
            .overlay(
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 3){
                        HStack {
                            Text("Latitude")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        } //: HSTACK
                        
                        Divider()
                        
                        HStack {
                            Text("Longitude")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        } //: HSTACK
                    } //: VSTACK
                } //: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
                , alignment: .top
            )
    }
}

// MARK: - PREVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
