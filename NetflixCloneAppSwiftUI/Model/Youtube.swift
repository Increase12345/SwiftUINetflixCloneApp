//
//  Youtube.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import Foundation

struct Youtube: Codable {
    let items: [Videos]
}

struct Videos: Codable {
    let id: Video
}

struct Video: Codable {
    let videoId: String
}
