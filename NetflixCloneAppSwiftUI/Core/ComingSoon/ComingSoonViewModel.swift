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
    
    let apiCall: APICall
    
    init(apiCall: APICall) {
        self.apiCall = apiCall
       fetchComingSoonMovies()
    }
    
    private func fetchComingSoonMovies() {
        Task {
            self.comingSoonMovies = try await apiCall.fetchMoviesAndTv(urlPath: Constants.comingSoonMovies)
        }
    }
}
