//
//  DownloadsExtension.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/19/23.
//

import Foundation

extension DownloadsView {
    func deleteMovie(at offsets: IndexSet) {
        for offset in offsets {
            let movie = movies[offset]
            moc.delete(movie)
        }
        try? moc.save()
    }
}
