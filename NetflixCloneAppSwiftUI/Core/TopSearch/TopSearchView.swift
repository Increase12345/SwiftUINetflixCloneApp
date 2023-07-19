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
                if !vm.searchText.isEmpty {
                    ForEach(vm.searchedMovies, id: \.id) { movie in
                        NavigationLink {
                            DetailView(movie: movie)
                        } label: {
                            MovieRowView(imageURL: movie.posterImage, title: movie.title ?? "")
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            vm.recentrySearchedMovies.append(movie)
                            vm.saveRecentMovie()
                        })
                    }
                } else {
                    VStack {
                        Text("Recently searched")
                            .padding(.leading)
                            .foregroundColor(.secondary)
                            .font(.footnote)
                        ForEach(vm.recentrySearchedMovies, id: \.id) { recentMovie in
                            MovieRowView(imageURL: recentMovie.posterImage, title: recentMovie.title ?? "")
                        }
                    }
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
