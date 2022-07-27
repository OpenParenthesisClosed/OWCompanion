//
//  FighterViewModel.swift
//  OWCompanion
//
//  Created by Furkan Türkmen on 20/07/2022.
//

import Foundation
import Firebase

class fighterViewModel: ObservableObject{
     
    @Published var fighters = [Fighter]()
    @Published var searchResults: [Fighter] = []
    private var db = Firestore.firestore()
     
    func sortFighterOnLastName(this:Fighter, that:Fighter) -> Bool {
      return this.lastName < that.lastName
    }

    func fetchData() {
        db.collection("fighters").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No fighters found")
                return
            }
             
            self.fighters = documents.map { (queryDocumentSnapshot) -> Fighter in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let isFavorite = data["isFavorite"] as? Bool ?? false
                let isLegend = data["isLegend"] as? Bool ?? false
                let isDlc = data["isDlc"] as? Bool ?? false
                let firstName = data["firstName"] as? String ?? ""
                let lastName = data["lastName"] as? String ?? ""
                let gender = data["gender"] as? String ?? ""
                let weightClass = data["weightClass"] as? String ?? ""
                let type = data["type"] as? String ?? ""
                let overall = data["overall"] as? Double ?? 0
                let standupOverall = data["standupOverall"] as? Double ?? 0
                let grapplingOverall = data["grapplingOverall"] as? Double ?? 0
                let healthOverall = data["healthOverall"] as? Double ?? 0
                
                let generalInfo = data["generalInfo"] as? [String: Any]
                // General info
                let nickName = generalInfo?["nickName"] as? String ?? ""
                let fightingOutOf = generalInfo?["fightingOutOf"] as? String ?? ""
                let age = generalInfo?["age"] as? Int ?? 0
                let height = generalInfo?["height"] as? String ?? ""
                let homeTown = generalInfo?["homeTown"] as? String ?? ""
                let reach = generalInfo?["reach"] as? String ?? ""
                let stance = generalInfo?["stance"] as? String ?? ""
                let weight = generalInfo?["weight"] as? String ?? ""
                
                let standupStats = data["standupStats"] as? [String: Any]
                // Standup stats
                let accuracy = standupStats?["accuracy"] as? Int ?? 0
                let blocking = standupStats?["blocking"] as? Int ?? 0
                let footWork = standupStats?["footWork"] as? Int ?? 0
                let headMovement = standupStats?["headMovement"] as? Int ?? 0
                let kickPower = standupStats?["kickPower"] as? Int ?? 0
                let kickSpeed = standupStats?["kickSpeed"] as? Int ?? 0
                let punchPower = standupStats?["punchPower"] as? Int ?? 0
                let punchSpeed = standupStats?["punchSpeed"] as? Int ?? 0
                let switchStance = standupStats?["switchStance"] as? Int ?? 0
                let takedownDefense = standupStats?["takedownDefense"] as? Int ?? 0
                let imageName = data["imageName"] as? String ?? ""

                
                let grapplingStats = data["grapplingStats"] as? [String: Any]
                // Grappling stats
                let bottomControl = grapplingStats?["bottomControl"] as? Int ?? 0
                let clinchControl = grapplingStats?["clinchControl"] as? Int ?? 0
                let clinchStriking = grapplingStats?["clinchStriking"] as? Int ?? 0
                let groundStriking = grapplingStats?["groundStriking"] as? Int ?? 0
                let submissions = grapplingStats?["submissions"] as? Int ?? 0
                let submissionsDefense = grapplingStats?["submissionsDefense"] as? Int ?? 0
                let takedowns = grapplingStats?["takedowns"] as? Int ?? 0
                let topControl = grapplingStats?["topControl"] as? Int ?? 0
                
                let healthStats = data["healthStats"] as? [String: Any]
                // Health stats
                let body = healthStats?["body"] as? Int ?? 0
                let cardio = healthStats?["cardio"] as? Int ?? 0
                let chin = healthStats?["chin"] as? Int ?? 0
                let legs = healthStats?["legs"] as? Int ?? 0
                let recovery = healthStats?["recovery"] as? Int ?? 0
             
                // Perks
                let perks = data["perks"] as? [String: String]

                // Top moves
                let topMoves = data["topMoves"] as? [String: Int]
                
                
                return Fighter(
                               id: id,
                               isFavorite: isFavorite,
                               isLegend: isLegend,
                               isDLC: isDlc,
                               firstName: firstName,
                               nickName: nickName,
                               lastName: lastName,
                               gender: gender,
                               weightClass: weightClass,
                               type: type,
                               fightingOutOf: fightingOutOf,
                               height: height,
                               hometown: homeTown,
                               reach: reach,
                               stance: stance,
                               weight: weight,
                               age: age,
                               overall: overall,
                               standupOverall: round(standupOverall * 10) / 10.0,
                               grapplingOverall: round(grapplingOverall * 10) / 10.0,
                               healthOverall: round(healthOverall * 10) / 10.0,
                               accuracy: accuracy,
                               blocking: blocking,
                               footWork: footWork,
                               headMovement: headMovement,
                               kickPower: kickPower,
                               kickSpeed: kickSpeed,
                               punchPower: punchPower,
                               punchSpeed: punchSpeed,
                               switchStance: switchStance,
                               takedownDefense: takedownDefense,
                               bottomControl: bottomControl,
                               clinchControl: clinchControl,
                               clinchStriking: clinchStriking,
                               groundStriking: groundStriking,
                               submissions: submissions,
                               submissionsDefense: submissionsDefense,
                               takedowns: takedowns,
                               topControl: topControl,
                               body: body,
                               cardio: cardio,
                               chin: chin,
                               legs: legs,
                               recovery: recovery,
                               perks: perks!,
                               topMoves: topMoves!,
                               imageName: imageName)
            }
        }
    }
}
