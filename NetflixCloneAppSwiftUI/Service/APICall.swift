//
//  APICall.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

struct Constants {
    static let baseMovieURL = "https://api.themoviedb.org/3"
    static let movieAPI = "8fc626b9b34342fd29749f14d1e6db2e"
    static let baseYoutubeURL = "https://youtube.googleapis.com/youtube/v3/search?"
    static let youtubeAPI = "AIzaSyAnp3p1tlgERCCRx-6xmAnUSLHWc5QYgNg"
}

class APICall {
    static let shared = APICall()
    
    // Method to fetch Trending Movies
    func fetchTrendingMovies() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/trending/all/day?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { fatalError() }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decodedData = try decoder.decode(Movies.self, from: data)
        
        return decodedData.results
    }
    
    // Method to fetch Trending TV
    func fetchTrendingTv() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/trending/tv/day?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { fatalError() }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decodedData = try decoder.decode(Movies.self, from: data)
        
        return decodedData.results
    }
    
    // Method to fetch PopularMovies
    func fetchPopularMovies() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/movie/popular?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { fatalError() }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decodedData = try decoder.decode(Movies.self, from: data)
        
        return decodedData.results
    }
    
    // Method to fetch Upcoming
    func fetchUpcomingMovies() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/movie/upcoming?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { fatalError() }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decodedData = try decoder.decode(Movies.self, from: data)
        
        return decodedData.results
    }
    
    // Method to fetch TopRated
    func fetchTopRatedMovies() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/movie/top_rated?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { fatalError() }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decodedData = try decoder.decode(Movies.self, from: data)
        
        return decodedData.results
    }
    
    //Method to fetch Video from Youtube
    func fetchYoutubeVideo(with query: String) async throws -> String {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { fatalError() }
        guard let url = URL(string: "\(Constants.baseYoutubeURL)q=\(query)&key=\(Constants.youtubeAPI)") else { fatalError() }
 
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(Youtube.self, from: data)
        
        let youtubeVideURL = "https://www.youtube.com/watch?v=\(decodedData.items[0].id.videoId)"

        return youtubeVideURL
    }
}
