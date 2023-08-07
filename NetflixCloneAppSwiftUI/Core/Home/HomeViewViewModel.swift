//
//  HomeViewViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

@MainActor
final class HomeViewViewModel: ObservableObject {
    @Published private(set) var trendingMovies = [Movie]()
    @Published private(set) var trendingTV = [Movie]()
    @Published private(set) var popularMovies = [Movie]()
    @Published private(set) var upcomingMovies = [Movie]()
    @Published private(set) var topRatedMovies = [Movie]()
    
    @Published var showAlert = false
    
    let apiCall: APICall
    
    init(apiCall: APICall) {
        self.apiCall = apiCall
        fetchMoviesAndTv()
        NotificationManager.shared.requestAutorization()
    }
    
    private func fetchMoviesAndTv() {
        Task {
            // Fetching Trending Movies
            self.trendingMovies = try await apiCall.fetchMoviesAndTv(urlPath: Constants.tredingMovies)
            
            // Fetching Trending Tv
            self.trendingTV = try await apiCall.fetchMoviesAndTv(urlPath: Constants.trendingTv)
            
            // Fetching Popular Movies
            self.popularMovies = try await apiCall.fetchMoviesAndTv(urlPath: Constants.popularMovies)
            
            // Fetching Upcoming Movies
            self.upcomingMovies = try await apiCall.fetchMoviesAndTv(urlPath: Constants.upcomingMovies)
            
            // Fetching Top Rated Movies
            self.topRatedMovies = try await apiCall.fetchMoviesAndTv(urlPath: Constants.topRatedMovies)
        }
    }
}
