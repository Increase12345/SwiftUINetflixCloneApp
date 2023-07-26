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
            
            // Rating row
            HStack {
                RatingStarsCell(rating: movie.voteAverage ?? 0)
                Spacer()
                Image(systemName: "hand.thumbsup")
                Text("\(movie.voteCount ?? 0)")
            }
            .padding(.horizontal)
            
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
            vm.fetchYoutubeVideo(with: movie.title ?? movie.originalName ?? "")
        }
        
        // Alert in case user wants to download a movie which already downloaded
        .alert("Alert", isPresented: $vm.showAlert) {} message: {
            Text(vm.showAlertMessage)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie.MOCK_DATA)
    }
}
