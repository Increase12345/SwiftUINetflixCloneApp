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
    let movie: Movie

    
    var body: some View {
        VStack {
            YouTubePlayerView("https://youtube.com/watch?v=psL_5RIBqnY")
                .frame(maxWidth: .infinity, maxHeight: 250)
            
            VStack(alignment: .leading) {
                Text(movie.title ?? movie.originalName ?? "No Title")
                    .font(.title2.bold())
                Text(movie.overview)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
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
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie.MOCK_DATA)
    }
}
