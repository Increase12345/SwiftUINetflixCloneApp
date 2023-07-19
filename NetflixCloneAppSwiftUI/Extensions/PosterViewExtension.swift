//
//  PosterViewExtension.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/19/23.
//

import Foundation

extension PosterView {
    func saveMovie() {
        var addingMovie = true
        for i in movies {
            if i.id == self.movie.id {
                addingMovie = false
            }
        }
        
        if addingMovie {
            let addMovie = MovieCore(context: moc)
            addMovie.id = Int64(self.movie.id)
            addMovie.title = self.movie.title
            addMovie.originalName = self.movie.originalName
            addMovie.originalTitle = self.movie.originalTitle
            addMovie.overview = self.movie.overview
            addMovie.posterPath = self.movie.posterImage
            addMovie.releaseDate = self.movie.releaseDate
            addMovie.voteAverage = self.movie.voteAverage ?? 0
            addMovie.voteCount = Int64(self.movie.voteCount ?? 0)
            addMovie.youtubeID = ""
            
            try? moc.save()
        }
    }
}
