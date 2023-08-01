//
//  APIConstants.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/17/23.
//

import Foundation

// Helping Constants for keys
struct Constants {
    
    // Base constans
    static let baseMovieURL = "https://api.themoviedb.org/3"
    static let movieAPI = "8fc626b9b34342fd29749f14d1e6db2e"
    static let baseYoutubeURL = "https://youtube.googleapis.com/youtube/v3/search?"
    static let youtubeAPI = "AIzaSyA5Gk1qmarLRGfVxbu0JHbEIEUE7oXafvk"
    
    // Movies and Tvs constans
    static let tredingMovies = "\(Constants.baseMovieURL)/trending/all/day?api_key=\(Constants.movieAPI)"
    static let trendingTv = "\(Constants.baseMovieURL)/trending/tv/day?api_key=\(Constants.movieAPI)"
    static let popularMovies = "\(Constants.baseMovieURL)/movie/popular?api_key=\(Constants.movieAPI)"
    static let upcomingMovies = "\(Constants.baseMovieURL)/movie/upcoming?api_key=\(Constants.movieAPI)"
    static let topRatedMovies = "\(Constants.baseMovieURL)/movie/top_rated?api_key=\(Constants.movieAPI)"
    static let comingSoonMovies = "\(Constants.baseMovieURL)/discover/movie?api_key=\(Constants.movieAPI)"
}
