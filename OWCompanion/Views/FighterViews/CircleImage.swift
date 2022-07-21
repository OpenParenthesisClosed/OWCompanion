//
//  CircleImage.swift
//  OWCompanion
//
//  Created by Furkan Türkmen on 21/07/2022.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(Color.limeGreenColor, lineWidth: 4)
            }
            .shadow(radius: 2)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("maxhollowayimg"))
    }
}
