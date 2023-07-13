//
//  SectionsOfMovies.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI
import Kingfisher

struct SectionsOfMovies: View {
    let sectionTitle: String
    var section: [Movie]
    
    var body: some View {
        VStack {
            HStack {
                Text(sectionTitle)
                    .font(.title2.bold())
                    .foregroundColor(.secondary)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(section, id: \.id) { movie in
                        NavigationLink {
                            DetailView(movie: movie)
                        } label: {
                            KFImage(URL(string: movie.posterImage))
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                        }
                    }
                }
            }
        }
        .padding(.top, 25)
        .padding(.leading, 15)
    }
}

struct SectionsOfMovies_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SectionsOfMovies(sectionTitle: "Trending Movies", section: [Movie]())
        }
    }
}
