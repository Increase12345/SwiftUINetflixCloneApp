//
//  MainTabView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationStack {
            TabView {
                
                // Main View with poster and sections
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                // List of coming soon Moview
                ComingSoonView()
                    .tabItem {
                        Label("Coming Soon", systemImage: "play.circle")
                    }
                
                // Search view to search for a movie or see recent searches
                TopSearchView()
                    .tabItem {
                        Label("Top Search", systemImage: "magnifyingglass")
                    }
                
                // List of downloaded Moviews
                DownloadsView()
                    .tabItem {
                        Label("Downloads", systemImage: "arrow.down.to.line")
                    }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
            MainTabView()
    }
}
