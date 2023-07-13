//
//  ComingSoonView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

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
                            MovieRowView(imageURL: movie.posterImage, title: movie.originalTitle ?? "")
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
