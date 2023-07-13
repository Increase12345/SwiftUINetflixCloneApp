//
//  MovieRowView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/13/23.
//

import SwiftUI
import Kingfisher

struct MovieRowView: View {
    let imageURL: String
    let title: String
    
    var body: some View {
        HStack {
            KFImage(URL(string: imageURL))
                .resizable()
                .scaledToFit()
                .frame(height: 150)
        
            Text(title)
                .multilineTextAlignment(.leading)
            Spacer()
            Image(systemName: "play.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
        }
        .padding(.horizontal)
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(imageURL: "", title: "Placeholder")
    }
}
