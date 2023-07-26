//
//  HomeViewViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

@MainActor
class HomeViewViewModel: ObservableObject {
    @Published private(set) var trendingMovies = [Movie]()
    @Published private(set) var trendingTV = [Movie]()
    @Published private(set) var popularMovies = [Movie]()
    @Published private(set) var upcomingMovies = [Movie]()
    @Published private(set) var topRatedMovies = [Movie]()
    
    @Published var showAlert = false
    
    init() {
        fetchTrendingMovies()
        NotificationManager.shared.requestAutorization()
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
