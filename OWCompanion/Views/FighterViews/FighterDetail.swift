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
                    
                    Text("#\(fighter.id)")
                    Spacer()
                    Text("Type: \(fighter.type)")
                    Text("Overall rating: \(fighter.overall.formatted())")
                    Text("Striking overall: \(fighter.strikingOverall.formatted())")
                    Text("Grapple overall: \(fighter.grappleOverall.formatted())")
                    Text("Health overall: \(fighter.healthOverall.formatted())")
                }.onAppear(){
                    self.viewModel.fetchData()
                }
                .padding()
            }
            .navigationTitle("\(fighter.firstName) \(fighter.lastName)")
            .navigationBarTitleDisplayMode(.inline)
        }
}
