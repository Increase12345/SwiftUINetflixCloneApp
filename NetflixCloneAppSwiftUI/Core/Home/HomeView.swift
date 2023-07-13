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
        ScrollView {
            VStack {
                HeaderView()
                
                PosterView()
                
                SectionsOfMovies(sectionTitle: "Trending Movies", vm: vm)
                
//                SectionsOfMovies(sectionTitle: "Trending TV")
//                
//                SectionsOfMovies(sectionTitle: "Popular")
//                
//                SectionsOfMovies(sectionTitle: "Upcoming Movies")
//                
//                SectionsOfMovies(sectionTitle: "Top Rated")
            }
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
