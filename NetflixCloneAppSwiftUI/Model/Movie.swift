//
//  Movie.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

struct Movies: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String?
    let originalName: String?
    let originalTitle: String?
    let overview: String
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    var posterImage: String {
        "https://image.tmdb.org/t/p/w500" + (posterPath ?? "")
    }
}

extension Movie {
    static let MOCK_DATA = Movie(id: 0, title: "Harry Potter", originalName: "Show of the dat", originalTitle: "Harry Potter", overview: "Very nice movie for kids", posterPath: "", releaseDate: "10-08-2028", voteAverage: 7, voteCount: 237)
}
