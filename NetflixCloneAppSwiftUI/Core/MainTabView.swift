//
//  MainTabView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct MainTabView: View {
    let apiCall = APICall()
    
    var body: some View {
        TabView {
                
            // Main View with poster and sections
            NavigationStack {
                HomeView(apiCall: apiCall)
            }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            // List of coming soon Moview
            NavigationStack {
                ComingSoonView(apiCall: apiCall)
            }
                .tabItem {
                    Label("Coming Soon", systemImage: "play.circle")
                }
            
            // Search view to search for a movie or see recent searches
            NavigationStack {
                TopSearchView(apiCall: apiCall)
            }
                .tabItem {
                    Label("Top Search", systemImage: "magnifyingglass")
                }
            
            // List of downloaded Moviews
            NavigationStack {
                DownloadsView(apiCall: apiCall)
            }
                .tabItem {
                    Label("Downloads", systemImage: "arrow.down.to.line")
                }
        }
        .preferredColorScheme(.dark)
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
