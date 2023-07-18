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
        List {
            ForEach(vm.comingSoonMovies, id: \.id) { movie in
                NavigationLink {
                    DetailView(movie: movie)
                } label: {
                    MovieRowView(imageURL: movie.posterImage, title: movie.originalTitle ?? "")
                }
            }
        }
        .listStyle(.plain)
        .padding(.top, 10)
        .navigationTitle("Upcoming")
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ComingSoonView()
        }
    }
}
