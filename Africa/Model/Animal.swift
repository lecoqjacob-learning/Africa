//
//  Animal.swift
//  Africa
//
//  Created by Jacob LeCoq on 3/10/21.
//

import Foundation

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}

extension Animal {
    static let allAnimals: [Animal] = Bundle.main.decode("animals.json")
    static let previewExample = allAnimals[0]
}
