//
//  NotificationViewControler.swift
//  MyAppHealth
//
//  Created by gelin maxence on 11/03/2025.
//

import UIKit
import UserNotifications

class NotificationViewControler: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission()
    }
    
    func checkPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.dispatchNotification()
                    }
                }
            case .denied:
                return
            case .authorized:
                self.dispatchNotification()
            default :
                return
            }
        }
        
    }
    
    func dispatchNotification() {
        let id = "id"
        let title = "title"
        let body = "body"
        let hour = 16
        let minute = 0
        let isdaily = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isdaily)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [id])
        notificationCenter.add(request)
    }
    
}
