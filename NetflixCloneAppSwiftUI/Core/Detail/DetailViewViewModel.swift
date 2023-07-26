//
//  DetailViewViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

@MainActor
class DetailViewViewModel: ObservableObject {
    @Published var youtubeVideoID = "GYkq9Rgoj8E"
    @Published var showAlert = false
    @Published var showAlertMessage = ""
    
    func fetchYoutubeVideo(with title: String) {
        Task {
            self.youtubeVideoID = try await APICall.shared.fetchYoutubeVideo(with: title + " trailer")
        }
    }
}
