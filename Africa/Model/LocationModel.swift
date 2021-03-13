//
//  LocationModel.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/11/21.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable{
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension NationalParkLocation {
    static let allLocations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    static let previewExample = allLocations[0]
}
