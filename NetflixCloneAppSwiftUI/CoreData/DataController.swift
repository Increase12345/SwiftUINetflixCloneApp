//
//  DataController.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/18/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "MovieCore")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
