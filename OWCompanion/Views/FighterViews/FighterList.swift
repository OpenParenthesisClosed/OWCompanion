/*
FighterList.swift
OWCompanion

Created by Furkan Türkmen on 20/07/2022.
*/


import SwiftUI

struct FighterList: View {
    @ObservedObject var viewModel = fighterViewModel()
    
    var body: some View {
        List(viewModel.fighters) { fighter in
            NavigationLink {
                FighterDetail(fighter: fighter)
            } label: {
                FighterRow(fighter: fighter)
            }
        }
        .onAppear(){
            self.viewModel.fetchData()
        }
        .navigationTitle("Fighters")
    }
}

struct FighterList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone XS Max"], id: \.self) { deviceName in
            FighterList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

