//
//  HomeView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewViewModel
    
    init(apiCall: APICall) {
        _vm = StateObject(wrappedValue: HomeViewViewModel(apiCall: apiCall))
    }
    
    var body: some View {
        VStack {
            HeaderView()
            ScrollView {
                VStack {
                    PosterView(movie: vm.upcomingMovies.last ?? Movie.MOCK_DATA, apiCall: vm.apiCall)
                    
                    SectionsOfMovies(sectionTitle: "Trending Movies", section: vm.trendingMovies, apiCall: vm.apiCall)
                    
                    SectionsOfMovies(sectionTitle: "Trending TV", section: vm.trendingTV, apiCall: vm.apiCall)
                    
                    SectionsOfMovies(sectionTitle: "Popular", section: vm.popularMovies, apiCall: vm.apiCall)
                    
                    SectionsOfMovies(sectionTitle: "Upcoming Movies", section: vm.upcomingMovies, apiCall: vm.apiCall)
                    
                    SectionsOfMovies(sectionTitle: "Top Rated", section: vm.topRatedMovies, apiCall: vm.apiCall)
                }
            }
        }
        .onReceive(vm.apiCall.$error, perform: { error in
            if error != nil {
                vm.showAlert = true
            }
        })
        .alert("Error", isPresented: $vm.showAlert) {
            Button("OK") { }
        } message: {
            Text(vm.apiCall.error?.localizedDescription ?? "")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let apiCall = APICall()
    static var previews: some View {
        NavigationStack {
            HomeView(apiCall: apiCall)
        }
    }
}
