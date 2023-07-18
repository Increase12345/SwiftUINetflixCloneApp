//
//  NetflixCloneAppSwiftUIApp.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

@main
struct NetflixCloneAppSwiftUIApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
