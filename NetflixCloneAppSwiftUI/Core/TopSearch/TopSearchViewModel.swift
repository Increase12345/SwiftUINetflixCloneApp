//
//  TopSearchViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/13/23.
//

import Foundation

@MainActor
class TopSearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchedMovies = [Movie]()
    
    func searchForMovie(with query: String) async throws {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        let urlPath = "https://api.themoviedb.org/3/search/movie?query=\(query)&api_key=8fc626b9b34342fd29749f14d1e6db2e"
        guard let url = URL(string: urlPath) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decodedData = try decoder.decode(Movies.self, from: data)
            
            self.searchedMovies = decodedData.results
        } catch {
            print(error)
        }
    }
}
