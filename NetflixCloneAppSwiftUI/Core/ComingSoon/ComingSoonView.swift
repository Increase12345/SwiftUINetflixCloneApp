//
//  ComingSoonView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct ComingSoonView: View {
    @StateObject var vm: ComingSoonViewModel
    
    init(apiCall: APICall) {
        _vm = StateObject(wrappedValue: ComingSoonViewModel(apiCall: apiCall))
    }
    
    var body: some View {
        ScrollView {
            ForEach(vm.comingSoonMovies, id: \.id) { movie in
                NavigationLink {
                    DetailView(movie: movie, apiCall: vm.apiCall)
                } label: {
                    MovieRowView(imageURL: movie.posterImage, title: movie.originalTitle ?? "")
                }
            }
        }
        .padding(.top, 10)
        .navigationTitle("Upcoming")
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static let apiCall = APICall()
    static var previews: some View {
        NavigationStack {
            ComingSoonView(apiCall: apiCall)
        }
    }
}
