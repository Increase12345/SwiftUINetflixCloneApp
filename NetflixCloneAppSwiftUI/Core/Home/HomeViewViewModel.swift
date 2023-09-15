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
    @Published private(set) var errorTitle = ""
    
    let apiCall: APICall
    
    init(apiCall: APICall) {
        self.apiCall = apiCall
        NotificationManager.shared.requestAutorization()
        fetchAllMoviesAndTv()
    }
    
    //MARK: Fetch All the movies and Tv's
    private func fetchAllMoviesAndTv() {
        fetchTrendingMovies()
        fetchTrendingTv()
        fetchPopularMovies()
        fetchUpcomingMovies()
        fetchTopRatedMovies()
    }
    
    //MARK: Fetching Trending Movies
    private func fetchTrendingMovies() {
        Task {
            do {
                self.trendingMovies = try await apiCall.fetchMoviesAndTv(urlPath: Constants.tredingMovies)
            } catch {
                errorTitle = "Failed to load trending movies: \(error.localizedDescription)"
                showAlert = true
            }
        }
    }
    
    //MARK: Fetching Trending Tv
    private func fetchTrendingTv() {
        Task {
            do {
                self.trendingTV = try await apiCall.fetchMoviesAndTv(urlPath: Constants.trendingTv)
            } catch {
                errorTitle = "Failed to load trending TV's"
            }
        }
    }
    
    //MARK: Fetching Popular Movies
    private func fetchPopularMovies() {
        Task {
            do {
                self.popularMovies = try await apiCall.fetchMoviesAndTv(urlPath: Constants.popularMovies)
            } catch {
                errorTitle = "Failed to load popular movies"
            }
        }
    }
    
    //MARK: Fetching Upcoming Movies
    private func fetchUpcomingMovies() {
        Task {
            do {
                self.upcomingMovies = try await apiCall.fetchMoviesAndTv(urlPath: Constants.upcomingMovies)
            } catch {
                errorTitle = "Failed to load upcoming movies"
            }
        }
    }
    
    //MARK: Fetching Top Rated Movies
    private func fetchTopRatedMovies() {
        Task {
            do {
                self.topRatedMovies = try await apiCall.fetchMoviesAndTv(urlPath: Constants.topRatedMovies)
            } catch {
                errorTitle = "Failed to load top rated movies"
            }
        }
    }
}
