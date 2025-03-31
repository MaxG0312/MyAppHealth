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
}
    
    func checkPermission(rem: Reminder) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.dispatchNotification(rem: rem)
                    }
                }
            case .denied:
                return
            case .authorized:
                self.dispatchNotification(rem: rem)
            default :
                return
            }
        }
        
    }
    
    func dispatchNotification(rem: Reminder) {
        let id = "Reminder_MyAppHealth_" + rem.title
        let title = "MyAppHealth"
        let body = "Your screen time reminder : " + rem.title + " is ringing"
        let hour = rem.hour
        let minute = rem.min
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
