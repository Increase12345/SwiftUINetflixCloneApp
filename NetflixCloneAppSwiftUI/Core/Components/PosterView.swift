//
//  PosterView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI
import Kingfisher

struct PosterView: View {
    let movie: Movie
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                KFImage(URL(string: movie.posterImage))
                    .resizable()
                    .scaledToFill()
                LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                    .opacity(0.8)
                
                
                HStack(spacing: 30) {
                    Button {
                        showSheet.toggle()
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
        .fullScreenCover(isPresented: $showSheet) {
            DetailView(movie: movie)
        }
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(movie: Movie.MOCK_DATA)
    }
}
