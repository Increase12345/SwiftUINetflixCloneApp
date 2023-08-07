//
//  TopSearchViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/13/23.
//

import Foundation

@MainActor
final class TopSearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published private(set) var searchedMovies = [Movie]()
    @Published private(set) var recentrySearchedMovies = [Movie]()
    
    let apiCall: APICall
    
    // FileManager path for recent searched movies
    let savePathForRecentMovie = FileManager.documentsDirectory.appendingPathComponent("SavedMovies")
    
    init(apiCall: APICall) {
        self.apiCall = apiCall
        fetchRecentSearchMovies()
    }
    
    // Search for movies on movie API
    func searchForMovie(with query: String) async throws {
        self.searchedMovies = try await apiCall.searchForMovies(with: query)
    }
    
    // Encoding recent search movies for FileManager
    private func encodeRecentSearchMovies() {
        do {
            let data = try JSONEncoder().encode(self.recentrySearchedMovies)
            try data.write(to: savePathForRecentMovie, options: [.atomic, .completeFileProtection])
        } catch {
            print("Failed to save recent movie \(error.localizedDescription)")
        }
    }
    
    // Decoding recently search movies from FileManager
    private func fetchRecentSearchMovies() {
        do {
            let data = try Data(contentsOf: savePathForRecentMovie)
            self.recentrySearchedMovies = try JSONDecoder().decode([Movie].self, from: data)
        } catch {
            print("Failed to fetch recent movies \(error.localizedDescription)")
        }
    }
    
    // Checking and Saving recently search movies to FileManager
    func addAndSaveRecentMovie(movie: Movie) {
        if recentrySearchedMovies.count >= 10 {
            recentrySearchedMovies.removeLast()
        }
        if !recentrySearchedMovies.contains(where: { $0.originalTitle == movie.originalTitle }) {
            recentrySearchedMovies.insert(movie, at: 0)
            encodeRecentSearchMovies()
        }
    }
}
