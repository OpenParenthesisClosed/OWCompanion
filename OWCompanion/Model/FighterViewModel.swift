//
//  FighterViewModel.swift
//  OWCompanion
//
//  Created by Furkan Türkmen on 20/07/2022.
//

import Foundation
import FirebaseFirestore

class fighterViewModel: ObservableObject{
     
    @Published var fighters = [Fighter]()
    @Published var searchResults: [Fighter] = []
    private var db = Firestore.firestore()
     
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
                let nickName = data["nickName"] as? String ?? ""
                let lastName = data["lastName"] as? String ?? ""
                let gender = data["gender"] as? String ?? ""
//                let weightClass = data["weightClass"] as? Collection ?? "0":"", "1":""
                let type = data["type"] as? String ?? ""
                let overall = data["overall"] as? Double ?? 0
                let strikingOverall = data["strikingOverall"] as? Double ?? 0
                let grappleOverall = data["grappleOverall"] as? Double ?? 0
                let healthOverall = data["healthOverall"] as? Double ?? 0
                let imageName = data["imageName"] as? String ?? ""
                return Fighter(id: id, isFavorite: isFavorite, isLegend: isLegend, isDLC: isDlc, firstName: firstName, nickName: nickName, lastName: lastName, gender: gender, type: type, overall: overall, strikingOverall: round(strikingOverall * 10) / 10.0, grappleOverall: round(grappleOverall * 10) / 10.0, healthOverall: round(healthOverall * 10) / 10.0, imageName: imageName)
            }
        }
    }
}
