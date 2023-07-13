//
//  ComingSoonView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI
import Kingfisher

struct ComingSoonView: View {
    @StateObject var vm = ComingSoonViewModel()
    
    var body: some View {
        VStack {
            Text("Upcoming")
                .font(.largeTitle.bold())
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView {
                LazyVStack {
                    ForEach(vm.comingSoonMovies, id: \.id) { movie in
                        NavigationLink {
                            DetailView(movie: movie)
                        } label: {
                            HStack {
                                KFImage(URL(string: movie.posterImage))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 150)
                                Text(movie.originalTitle ?? "")
                                Spacer()
                                Image(systemName: "play.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ComingSoonView()
        }
    }
}
