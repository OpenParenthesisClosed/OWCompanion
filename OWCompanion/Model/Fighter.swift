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

struct Fighter: Codable, Identifiable {
    let id: String
    let isFavorite, isLegend, isDLC: Bool
    let firstName, nickName, lastName, gender, weightClass, type: String
    
    // General info
    let fightingOutOf, height, hometown, reach, stance, weight: String
    let age: Int
    
    // Overalls
    let overall, standupOverall, grapplingOverall, healthOverall: Double
    
    // Standup stats
    let accuracy, blocking, footWork, headMovement, kickPower, kickSpeed, punchPower, punchSpeed, switchStance, takedownDefense: Int
    
    // Grappling stats
    let bottomControl, clinchControl, clinchStriking, groundStriking, submissions, submissionsDefense, takedowns, topControl: Int
    
    // Health stats
    let body, cardio, chin, legs, recovery: Int
    
    // Perks
    var perks: [String: String]
    
    // Top moves
    var topMoves: [String: Int]

    // Image
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var sortedPerks: [(String, String)] {
        perks.keys.compactMap { key in
            perks[key] != nil ? (key, perks[key]!) : nil
        }
    }
    
    var sortedTopMoves: [(String, Int)] {
        topMoves.keys.compactMap { key in
            topMoves[key] != nil ? (key, topMoves[key]!) : nil
        }
    }
}
