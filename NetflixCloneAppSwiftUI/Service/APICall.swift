//
//  APICall.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

class APICall {
    static let shared = APICall()
    
    // Method to fetch Trending Movies
    func fetchTrendingMovies() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/trending/all/day?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
        
        return decodedData.results
    }
    
    // Method to fetch Trending TV
    func fetchTrendingTv() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/trending/tv/day?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
        
        return decodedData.results
    }
    
    // Method to fetch PopularMovies
    func fetchPopularMovies() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/movie/popular?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
        
        return decodedData.results
    }
    
    // Method to fetch Upcoming
    func fetchUpcomingMovies() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/movie/upcoming?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
        
        return decodedData.results
    }
    
    // Method to fetch TopRated
    func fetchTopRatedMovies() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/movie/top_rated?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
        
        return decodedData.results
    }
    
    // Method to fetch DiscoverMovies
    func fetchDiscoverMovies() async throws -> [Movie] {
        let urlPath = "\(Constants.baseMovieURL)/discover/movie?api_key=\(Constants.movieAPI)"
        guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
        
        return decodedData.results
    }
    
    //Method to fetch Video from Youtube
    func fetchYoutubeVideo(with query: String) async throws -> String {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { fatalError() }
        guard let url = URL(string: "\(Constants.baseYoutubeURL)q=\(query)&key=\(Constants.youtubeAPI)") else { throw APIError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
        guard let decodedData = try? JSONDecoder().decode(Youtube.self, from: data) else { throw APIError.inavlidData}
        
        let youtubeVideoID = "\(decodedData.items[0].id.videoId)"

        return youtubeVideoID
    }
}
