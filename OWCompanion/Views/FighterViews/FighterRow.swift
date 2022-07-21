/*
FighterRow.swift
OWCompanion

Created by Furkan Türkmen on 20/07/2022.
*/

import SwiftUI

struct FighterRow: View{
    @ObservedObject private var viewModel = fighterViewModel()
    var fighter: Fighter

    var body: some View{
        HStack{
            fighter.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(fighter.firstName+" " + fighter.lastName)
            
            Spacer()
        }
    }
}

struct FighterRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            FighterRow(fighter: viewModel.fighters[0])
//            FighterRow(fighter: viewModel.fighters[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

