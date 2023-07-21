//
//  HomeView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView()
            ScrollView {
                VStack {
                    PosterView(movie: vm.upcomingMovies.last ?? Movie.MOCK_DATA)
                    
                    SectionsOfMovies(sectionTitle: "Trending Movies", section: vm.trendingMovies)
                    
                    SectionsOfMovies(sectionTitle: "Trending TV", section: vm.trendingTV)
                    
                    SectionsOfMovies(sectionTitle: "Popular", section: vm.popularMovies)
                    
                    SectionsOfMovies(sectionTitle: "Upcoming Movies", section: vm.upcomingMovies)
                    
                    SectionsOfMovies(sectionTitle: "Top Rated", section: vm.topRatedMovies)
                }
            }
        }
        .onReceive(APICall.shared.$error) { error in
            if error != nil {
                vm.showAlert = true
            }
        }
        .alert("Erorr", isPresented: $vm.showAlert) {
            Button("Ok") { vm.showAlert = false }
        } message: {
            Text(APICall.shared.error ?? "")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
