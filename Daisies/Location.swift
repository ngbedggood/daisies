//
//  Location.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 05/01/2025.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
}
