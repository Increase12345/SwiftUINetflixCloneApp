//
//  ComingSoonViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/13/23.
//

import Foundation

@MainActor
class ComingSoonViewModel: ObservableObject {
    @Published private(set) var comingSoonMovies = [Movie]()
    
    init() {
       fetchDiscoverMovies()
    }
    
    private func fetchDiscoverMovies() {
        Task {
            self.comingSoonMovies = try await APICall.shared.fetchDiscoverMovies()
        }
    }
}
