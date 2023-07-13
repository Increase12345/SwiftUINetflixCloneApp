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
    @ObservedObject var vm: HomeViewViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(sectionTitle)
                    .font(.title2.bold())
                    .foregroundColor(.secondary)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(vm.trendingMovies, id: \.id) { movie in
                        NavigationLink {
                            DetailView()
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
            SectionsOfMovies(sectionTitle: "Trending Movies", vm: HomeViewViewModel())
        }
    }
}
