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
            
            ScrollView {
                
                // Displaying list of Searching now movies
                if !vm.searchText.isEmpty {
                    ForEach(vm.searchedMovies, id: \.id) { movie in
                        NavigationLink {
                            DetailView(movie: movie)
                        } label: {
                            MovieRowView(imageURL: movie.posterImage, title: movie.title ?? "")
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            vm.recentrySearchedMovies.insert(movie, at: 0)
                            vm.saveRecentMovies()
                        })
                    }
                    
                    // Displaying list of Recently Searched movies
                } else {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Recently searched:")
                            .foregroundColor(.secondary)
                            .font(.footnote)
                        
                        ForEach(vm.recentrySearchedMovies, id: \.id) { recentMovie in
                            Text(recentMovie.title ?? recentMovie.originalTitle ?? recentMovie.originalName ?? "")
                                .onTapGesture {
                                    vm.searchText = recentMovie.title ?? recentMovie.originalTitle ?? recentMovie.originalName ?? ""
                                }
                        }
                    }
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
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
