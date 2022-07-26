/*
FighterList.swift
OWCompanion

Created by Furkan Türkmen on 20/07/2022.
*/


import SwiftUI

struct FighterList: View {
    @State private var searchTerm = ""
    @ObservedObject var viewModel = fighterViewModel()
    
    var listData: [Fighter]{
        if searchTerm.isEmpty{
            return viewModel.fighters.sorted(by: self.viewModel.sortFighterOnLastName)
        } else {
            return viewModel.searchResults.sorted(by: self.viewModel.sortFighterOnLastName)
        }
    }
    
    var body: some View {
        List(listData) { fighter in
            NavigationLink {
                FighterDetail(fighter: fighter)
            } label: {
                FighterRow(fighter: fighter)
            }
        }.animation(.default, value: searchTerm)
        .onAppear(){
            self.viewModel.fetchData()
        }.searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchTerm){ searchTerm in
                viewModel.searchResults = viewModel.fighters.filter({ fighter in
                    fighter.firstName.lowercased().contains(searchTerm.lowercased()) || fighter.lastName.lowercased().contains(searchTerm.lowercased()) || fighter.nickName.lowercased().contains(searchTerm.lowercased())
                })
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

