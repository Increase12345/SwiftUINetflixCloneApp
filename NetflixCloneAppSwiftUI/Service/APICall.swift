//
//  APICall.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

class APICall {
    static let shared = APICall()
    
    func fetchTrendingMovies() async throws -> [Movie] {
        let urlPath = "https://api.themoviedb.org/3/trending/all/day?api_key=8fc626b9b34342fd29749f14d1e6db2e"
        guard let url = URL(string: urlPath) else { fatalError() }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decodedData = try decoder.decode(Movies.self, from: data)
        
        return decodedData.results
    }
}
