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
    @State private var count = 0
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(vm.searchedMovies, id: \.id) { movie in
                        NavigationLink {
                            DetailView(movie: movie)
                        } label: {
                            MovieRowView(imageURL: movie.posterImage, title: movie.title ?? "")
                        }
                    }
                }
            }
            .searchable(text: $vm.searchText)
            .onChange(of: vm.searchText) { _ in
                Task {
                    try await vm.searchForMovie(with: vm.searchText)
                }
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
