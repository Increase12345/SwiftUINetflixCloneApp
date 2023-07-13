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
    @Published var trendingTV = [Movie]()
    @Published var popularMovies = [Movie]()
    @Published var upcomingMovies = [Movie]()
    @Published var topRatedMovies = [Movie]()
    
    init() {
        fetchTrendingMovies()
    }
    
    private func fetchTrendingMovies() {
        Task {
            self.trendingMovies = try await APICall.shared.fetchTrendingMovies()
            self.trendingTV = try await APICall.shared.fetchTrendingTv()
            self.popularMovies = try await APICall.shared.fetchPopularMovies()
            self.upcomingMovies = try await APICall.shared.fetchUpcomingMovies()
            self.topRatedMovies = try await APICall.shared.fetchTopRatedMovies()
        }
    }
}
