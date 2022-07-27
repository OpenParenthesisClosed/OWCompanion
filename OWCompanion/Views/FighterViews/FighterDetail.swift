//
//  FighterDetail.swift
//  OWCompanion
//
//  Created by Furkan Türkmen on 20/07/2022.
//

import SwiftUI

struct FighterDetail: View {
    var fighter: Fighter
    
    @ObservedObject private var viewModel = fighterViewModel()
    
    var body: some View {
        
            ScrollView {
                CircleImage(image: fighter.image)
                    .offset(y: 0)

                detailedFigter
            }
            .navigationTitle("\(fighter.firstName) \(fighter.lastName)")
            .navigationBarTitleDisplayMode(.inline)
        }
    
    var detailedFigter: some View{
        VStack(alignment: .leading) {
            Text("\(fighter.firstName) \(fighter.lastName)")
                .font(.title)

            HStack {
                Text("About \(fighter.nickName)")
                    .font(.title2)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)

            Divider()
            VStack{
                Text("Type: \(fighter.type)\nOverall rating: \(fighter.overall.formatted())\nAge: \(fighter.age)\nHeight: \(fighter.height)\nWeight: \(fighter.weight)\nHome town: \(fighter.hometown)\nReach: \(fighter.reach)\nStance: \(fighter.stance)")
            }
            Spacer()
            HStack{
                VStack{
                    Text("Standup overall: \(fighter.standupOverall.formatted()) \nAccuracy: \(fighter.accuracy) \nBlocking: \(fighter.blocking) \nFootwork: \(fighter.footWork) \nHead movement: \(fighter.headMovement) \nKick power: \(fighter.kickPower) \nKick speed: \(fighter.kickSpeed) \nPunch power: \(fighter.punchPower) \nPunch speed: \(fighter.punchSpeed) \nSwitch stance: \(fighter.switchStance) \nTakedown defense: \(fighter.takedownDefense)")
                }
                VStack{
                    Text("Grappling rating: \(fighter.grapplingOverall.formatted()) \nBottom control: \(fighter.bottomControl)\nClinch control: \(fighter.clinchControl)\nClinch striking: \(fighter.clinchStriking)\nSubmissions: \(fighter.submissions)\nSubmissions defense: \(fighter.submissionsDefense)\nTakedowns: \(fighter.takedowns)\nTop control: \(fighter.topControl)")
                                            
                }
                VStack{
                    Text("Health rating: \(fighter.healthOverall.formatted())\nBody: \(fighter.body)\nCardio: \(fighter.cardio)\nChin: \(fighter.chin)\nLegs: \(fighter.legs)\nRecovery: \(fighter.recovery)\nPerks:")

                    ForEach(fighter.sortedPerks, id: \.0) { (key, value) in
                        Text("\(key): \(value)")
                    }
                    ForEach(fighter.sortedTopMoves, id: \.0) { (key, value) in
                        Text("\(key): \(value)")
                    }
                }
            }
        }.onAppear(){
            self.viewModel.fetchData()
            print(fighter.perks.keys as Any)
            print(fighter.perks.values as Any)
            print(fighter.topMoves.keys as Any)
            print(fighter.topMoves.values as Any)
        }
        .padding()
    }
}
extension String: Identifiable {
    public var id: String {
        self
    }
}
