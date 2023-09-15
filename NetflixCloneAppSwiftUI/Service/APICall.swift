//
//  APICall.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

actor APICall {
    private let decoder = JSONDecoder()
    
    // Method to fetch Trending Movies
    func fetchMoviesAndTv(urlPath: String) async throws -> [Movie] {
        do {
            guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let decodedData = try? decoder.decode(Movies.self, from: data) else { throw APIError.inavlidData }
            
            return decodedData.results
        } catch {
            throw APIError.unknown(error)
        }
    }
    
    // Method for searching Movies
    func searchForMovies(with query: String) async throws -> [Movie] {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { throw APIError.inavlidData }
        let urlPath = "https://api.themoviedb.org/3/search/movie?query=\(query)&api_key=8fc626b9b34342fd29749f14d1e6db2e"
        guard let url = URL(string: urlPath) else { throw APIError.invalidURL }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decodedData = try decoder.decode(Movies.self, from: data)
            
            return decodedData.results
        } catch {
            throw APIError.unknown(error)
        }
    }
    
    //Method to fetch Video from Youtube
    func fetchYoutubeVideo(with query: String) async throws -> String {
        do {
            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { fatalError() }
            guard let url = URL(string: "\(Constants.baseYoutubeURL)q=\(query)&key=\(Constants.youtubeAPI)") else { throw APIError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw APIError.serverError }
            guard let decodedData = try? decoder.decode(Youtube.self, from: data) else { throw APIError.inavlidData}
            
            let youtubeVideoID = "\(decodedData.items[0].id.videoId)"
            
            return youtubeVideoID
        } catch {
            throw APIError.unknown(error)
        }
    }
}
