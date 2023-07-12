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
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ComingSoonView()
                .tabItem {
                    Label("Coming Soon", systemImage: "play.circle")
                }
            TopSearchView()
                .tabItem {
                    Label("Top Search", systemImage: "magnifyingglass")
                }
            DownloadsView()
                .tabItem {
                    Label("Downloads", systemImage: "arrow.down.to.line")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
