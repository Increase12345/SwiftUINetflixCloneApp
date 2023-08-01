//
//  ComingSoonViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/13/23.
//

import Foundation

@MainActor
final class ComingSoonViewModel: ObservableObject {
    @Published private(set) var comingSoonMovies = [Movie]()
    
    init() {
       fetchComingSoonMovies()
    }
    
    private func fetchComingSoonMovies() {
        Task {
            self.comingSoonMovies = try await APICall.shared.fetchMoviesAndTv(urlPath: Constants.comingSoonMovies)
        }
    }
}
