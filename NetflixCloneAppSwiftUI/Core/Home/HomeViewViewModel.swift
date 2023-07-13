//
//  HomeViewViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

@MainActor
class HomeViewViewModel: ObservableObject {
    @Published var trendingMovies = [Movie]()
    
    init() {
        fetchTrendingMovies()
    }
    
    private func fetchTrendingMovies() {
        Task {
            self.trendingMovies = try await APICall.shared.fetchTrendingMovies()
        }
    }
}
