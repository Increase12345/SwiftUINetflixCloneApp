//
//  DetailView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI
import YouTubePlayerKit

struct DetailView: View {
    @StateObject var vm = DetailViewViewModel()
    @Environment(\.dismiss) var dismiss
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
            YouTubePlayerView("https://youtube.com/watch?v=psL_5RIBqnY")
                .frame(maxWidth: .infinity, maxHeight: 250)
            
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
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie.MOCK_DATA)
    }
}
