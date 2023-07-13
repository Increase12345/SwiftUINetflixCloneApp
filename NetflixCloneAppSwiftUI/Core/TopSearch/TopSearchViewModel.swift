//
//  TopSearchViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/13/23.
//

import Foundation

@MainActor
class TopSearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchedMovies = [Movie]()
    
    func searchMovie(with query: String) {
        Task {
            self.searchedMovies = try await APICall.shared.searchMovie(with: searchText)
        }
    }
}
