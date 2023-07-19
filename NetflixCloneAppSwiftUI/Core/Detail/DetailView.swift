//
//  DetailView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var vm = DetailViewViewModel()
  
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<MovieCore>
    @Environment(\.managedObjectContext) var moc
    
    let movie: Movie
    
    var body: some View {
        ScrollView {

            // Video Player
            YoutubeVideoView(youtubeVideoID: vm.youtubeVideoID)
                .frame(height: 250)
            
            // Overview about selected movie
            VStack(alignment: .leading) {
                Text(movie.title ?? movie.originalName ?? "No Title")
                    .font(.title2.bold())
                Text(movie.overview)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            // Download moview
            Button {
                saveMovie()
            } label: {
                Text("Download")
                    .frame(width: 130, height: 35)
                    .background(.red)
                    .cornerRadius(5)
                    .padding()
            }
        }
        .onAppear {
            //vm.fetchYoutubeVideo(with: movie.title ?? movie.originalName ?? "")
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
            addMovie.youtubeID = vm.youtubeVideoID
            
            try? moc.save()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie.MOCK_DATA)
    }
}
