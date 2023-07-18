//
//  DetailView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var vm = DetailViewViewModel()
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    let movie: Movie
    
    var body: some View {
        VStack {
            
            // Dismiss View Button
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("< Back")
                        .padding(.leading)
                }
                Spacer()
            }
            
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
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            //vm.fetchYoutubeVideo(with: movie.title ?? movie.originalName ?? "")
        }
    }
    
    func saveMovie() {
        let movie = MovieCore(context: moc)
        movie.id = Int64(self.movie.id)
        movie.title = self.movie.title
        movie.originalName = self.movie.originalName
        movie.originalTitle = self.movie.originalTitle
        movie.overview = self.movie.overview
        movie.posterPath = self.movie.posterImage
        movie.releaseDate = self.movie.releaseDate
        movie.voteAverage = self.movie.voteAverage ?? 0
        movie.voteCount = Int64(self.movie.voteCount ?? 0)
        movie.youtubeID = vm.youtubeVideoID
        
        try? moc.save()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie.MOCK_DATA)
    }
}
