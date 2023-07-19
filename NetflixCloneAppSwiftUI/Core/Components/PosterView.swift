//
//  PosterView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI
import Kingfisher

struct PosterView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<MovieCore>
    let movie: Movie
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                KFImage(URL(string: movie.posterImage))
                    .resizable()
                    .scaledToFill()
                LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                    .opacity(0.8)
                
                
                HStack(spacing: 30) {
                    NavigationLink {
                        DetailView(movie: movie)
                    } label: {
                        Text("Play")
                            .foregroundColor(.white)
                            .frame(width: 130, height: 35)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white)
                            )
                    }
                    
                    Button {
                        saveMovie()
                    } label: {
                        Text("Download")
                            .foregroundColor(.white)
                            .frame(width: 130, height: 35)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white)
                            )
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
    
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

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(movie: Movie.MOCK_DATA)
    }
}
