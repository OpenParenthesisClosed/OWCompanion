//
//  Fighter.swift
//  OWCompanion
//
//  Created by Furkan Türkmen on 20/07/2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fighter = try? newJSONDecoder().decode(Fighter.self, from: jsonData)

import Foundation
import SwiftUI

struct Fighter: Hashable, Codable, Identifiable {
    let id: String
    let isFavorite, isLegend, isDLC: Bool
    let firstName, nickName, lastName, gender: String
//    let weightClass: [String: String]
    let type: String
    let overall, strikingOverall, grappleOverall, healthOverall: Double
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
