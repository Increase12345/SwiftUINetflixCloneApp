//
//  DetailViewViewModel.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

@MainActor
class DetailViewViewModel: ObservableObject {
    @Published var youtubeVideoURL = ""
    //@Published var video: YouTubePlayer = ""
    
    
    init() {
        
    }
    
    func fetchYoutubeVideo() {
        Task {
            self.youtubeVideoURL = try await APICall.shared.fetchYoutubeVideo(with: "Harry Potter")
            //video = YouTubePlayer(stringLiteral: youtubeVideoURL)
        }
    }
}
