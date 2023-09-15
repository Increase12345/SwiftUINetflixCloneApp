//
//  NotificationManager.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/19/23.
//

import Foundation
import UserNotifications

final class NotificationManager {
    static let shared = NotificationManager()
    
    // Asking permission of user to get notification
    func requestAutorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("User declined autorization \(error)")
            } else {
                //print("User allowed to send notifications")
            }
        }
    }
    
    // Requesting notification
    func scheduleNotification(title: String, subtitle: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
