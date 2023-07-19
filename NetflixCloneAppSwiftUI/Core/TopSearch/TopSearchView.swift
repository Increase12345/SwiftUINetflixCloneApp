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
    
    var body: some View {
        VStack {
            SearchBarView(text: $vm.searchText)
            
            List {
                if !vm.searchText.isEmpty {
                    ForEach(vm.searchedMovies, id: \.id) { movie in
                        NavigationLink {
                            DetailView(movie: movie)
                        } label: {
                            MovieRowView(imageURL: movie.posterImage, title: movie.title ?? "")
                        }
                    }
                } else {
                    ForEach(vm.recentrySearchedMovies, id: \.id) { recentMovie in
                        Text(recentMovie.title ?? recentMovie.originalName ?? recentMovie.originalTitle ?? "")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Search")
        }
        .padding(.bottom, 1)
        
        // Searching Listener
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
