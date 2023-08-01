//
//  APICall.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

final class APICall {
    static let shared = APICall()
    
    @Published private(set) var error: String?
    
    private init() { }
    
    // Method to fetch Trending Movies
    func fetchTrendingMovies() async throws -> [Movie] {
        do {
            let urlPath = "\(Constants.baseMovieURL)/trending/all/day?api_key=\(Constants.movieAPI)"
            guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
            
            return decodedData.results
        } catch {
            self.error = "Failed to fetch Trending Movies. \(error.localizedDescription)"
            return []
        }
    }
    
    // Method to fetch Trending TV
    func fetchTrendingTv() async throws -> [Movie] {
        do {
            let urlPath = "\(Constants.baseMovieURL)/trending/tv/day?api_key=\(Constants.movieAPI)"
            guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
            
            return decodedData.results
        } catch {
            self.error = "Failed to fetch Trending Tv. \(error.localizedDescription)"
            return []
        }
    }
    
    // Method to fetch PopularMovies
    func fetchPopularMovies() async throws -> [Movie] {
        do {
            let urlPath = "\(Constants.baseMovieURL)/movie/popular?api_key=\(Constants.movieAPI)"
            guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
            
            return decodedData.results
        } catch {
            self.error = "Failed to fetch Popular Movies. \(error.localizedDescription)"
            return []
        }
    }
    
    // Method to fetch Upcoming
    func fetchUpcomingMovies() async throws -> [Movie] {
        do {
            let urlPath = "\(Constants.baseMovieURL)/movie/upcoming?api_key=\(Constants.movieAPI)"
            guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
            
            return decodedData.results
        } catch {
            self.error = "Failed to fetch Upcoming Movies. \(error.localizedDescription)"
            return []
        }
    }
    
    // Method to fetch TopRated
    func fetchTopRatedMovies() async throws -> [Movie] {
        do {
            let urlPath = "\(Constants.baseMovieURL)/movie/top_rated?api_key=\(Constants.movieAPI)"
            guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
            
            return decodedData.results
        } catch {
            self.error = "Failed to fetch Top rated Movies. \(error.localizedDescription)"
            return []
        }
    }
    
    // Method to fetch DiscoverMovies
    func fetchDiscoverMovies() async throws -> [Movie] {
        do {
            let urlPath = "\(Constants.baseMovieURL)/discover/movie?api_key=\(Constants.movieAPI)"
            guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
            
            return decodedData.results
        } catch {
            self.error = "Failed to fetch Discover Movies. \(error.localizedDescription)"
            return []
        }
    }
    
    //Method to fetch Video from Youtube
    func fetchYoutubeVideo(with query: String) async throws -> String {
        do {
            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { fatalError() }
            guard let url = URL(string: "\(Constants.baseYoutubeURL)q=\(query)&key=\(Constants.youtubeAPI)") else { throw APIError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
            guard let decodedData = try? JSONDecoder().decode(Youtube.self, from: data) else { throw APIError.inavlidData}
            
            let youtubeVideoID = "\(decodedData.items[0].id.videoId)"
            
            return youtubeVideoID
        } catch {
            self.error = "Failed to fetch Youtube ID. \(error.localizedDescription)"
            return ""
        }
    }
}
