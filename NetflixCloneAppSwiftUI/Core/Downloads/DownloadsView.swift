//
//  DownloadsView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct DownloadsView: View {
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<MovieCore>
    @Environment(\.managedObjectContext) var moc
    let apiCall: APICall
    
    var body: some View {
        List {
            ForEach(movies, id: \.id) { movie in
                NavigationLink {
                    let DetailMovie = Movie(id: Int(movie.id), title: movie.title, originalName: movie.originalName, originalTitle: movie.originalTitle, overview: movie.overview ?? "", posterPath: movie.posterPath, releaseDate: movie.releaseDate, voteAverage: movie.voteAverage, voteCount: Int(movie.voteCount))
                    DetailView(movie: DetailMovie, apiCall: apiCall)
                } label: {
                    MovieRowView(imageURL: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")", title: movie.title ?? movie.originalName ?? "")
                }
            }
            .onDelete(perform: deleteMovie(at:))
            .padding(.top, 10)
            .navigationTitle("Downloads")
        }
        .listStyle(.plain)
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static let apiCall = APICall()
    static var previews: some View {
        NavigationStack {
            DownloadsView(apiCall: apiCall)
        }
    }
}
