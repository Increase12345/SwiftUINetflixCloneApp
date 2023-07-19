//
//  MainTabView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
                
            // Main View with poster and sections
            NavigationStack {
                HomeView()
            }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            // List of coming soon Moview
            NavigationStack {
                ComingSoonView()
            }
                .tabItem {
                    Label("Coming Soon", systemImage: "play.circle")
                }
            
            // Search view to search for a movie or see recent searches
            NavigationStack {
                TopSearchView()
            }
                .tabItem {
                    Label("Top Search", systemImage: "magnifyingglass")
                }
            
            // List of downloaded Moviews
            NavigationStack {
                DownloadsView()
            }
                .tabItem {
                    Label("Downloads", systemImage: "arrow.down.to.line")
                }
        }
        .preferredColorScheme(.dark)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
