//
//  TopSearchView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI
import Kingfisher

struct TopSearchView: View {
    @StateObject var vm = TopSearchViewModel()
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    
                    // List of Movies recently searched
                    if vm.searchText.isEmpty {
                        ForEach(vm.recentrySearchedMovies, id: \.id) { recentMovie in
                            MovieRowView(imageURL: recentMovie.posterImage, title: recentMovie.title ?? "")
                        }
                        
                        // List of Movies you are currently searching
                    } else {
                        ForEach(vm.searchedMovies, id: \.id) { movie in
                            Button {
                                let movie = Movie(id: movie.id, title: movie.title, originalName: movie.originalName, originalTitle: movie.originalTitle, overview: movie.overview, posterPath: movie.posterPath, releaseDate: movie.releaseDate, voteAverage: movie.voteAverage, voteCount: movie.voteCount)
                                vm.recentrySearchedMovies.append(movie)
                                showDetail.toggle()
                            } label: {
                                MovieRowView(imageURL: movie.posterImage, title: movie.title ?? "")
                            }
                            .fullScreenCover(isPresented: $showDetail) {
                                DetailView(movie: movie)
                            }
                        }
                    }
                }
            }
        }
        // Searching Listener
        .searchable(text: $vm.searchText)
        .onChange(of: vm.searchText) { _ in
            Task {
                try await vm.searchForMovie(with: vm.searchText)
            }
        }
    }
}

struct TopSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TopSearchView()
        }
    }
}
