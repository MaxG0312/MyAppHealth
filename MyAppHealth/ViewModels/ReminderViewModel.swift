//
//  ReminderViewModel.swift
//  MyAppHealth
//
//  Created by gelin maxence on 31/03/2025.
//

import Foundation

class ReminderViewModel: ObservableObject {
    
    @Published var reminders: [Reminder] = []
    private let notificationController = NotificationViewControler()
    
    init() {
        getReminders()
    }
    
    func getReminders() {
        self.reminders.append(contentsOf: Reminder.testData)
    }
    
    func addReminder(reminder: Reminder) {
        self.reminders.append(reminder)
        notificationController.checkPermission(rem: reminder)
    }
    
    func deleteReminder(indexSet: IndexSet) {
        self.reminders.remove(atOffsets: indexSet)
    }
    
    func moveReminder(from: IndexSet, to: Int) {
        self.reminders.move(fromOffsets: from, toOffset: to)
    }
    
    func updateReminder(rem: Reminder, newRem: Reminder) {
        for (index, r) in reminders.enumerated() {
            if rem.id == r.id {
                self.reminders[index] = newRem
                notificationController.checkPermission(rem: newRem)
            }
        }
    }
}
