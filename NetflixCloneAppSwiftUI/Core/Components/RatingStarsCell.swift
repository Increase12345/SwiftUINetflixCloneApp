//
//  RatingStarsCell.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/19/23.
//

import SwiftUI

struct RatingStarsCell: View {
    var rating: Double

    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(Int(rating) / 2 > index ? .yellow: .secondary)
            }
        }
    }
}

struct RatingStarsCell_Previews: PreviewProvider {
    static var previews: some View {
        RatingStarsCell(rating: 3)
    }
}
