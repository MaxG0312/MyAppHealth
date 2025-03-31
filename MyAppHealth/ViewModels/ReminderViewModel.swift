//
//  ReminderViewModel.swift
//  MyAppHealth
//
//  Created by gelin maxence on 31/03/2025.
//

import Foundation

class ReminderViewModel: ObservableObject {
    
    @Published var reminders: [Reminder] = []
    
    init() {
        getReminders()
    }
    
    func getReminders() {
        self.reminders.append(contentsOf: Reminder.testData)
    }
    
    func addReminder(reminder: Reminder) {
        self.reminders.append(reminder)
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
            }
        }
    }
    
}
