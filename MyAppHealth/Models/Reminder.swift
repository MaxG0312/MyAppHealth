//
//  Reminder.swift
//  MyAppHealth
//
//  Created by gelin maxence on 31/03/2025.
//

import Foundation

struct Reminder: Identifiable {
    // identifiable doit toujours avoir un id
    var id = UUID()
    var title: String
    var hour: Int
    var min: Int
    var sec: Int
    
    static var testData = [
        Reminder(title: "Work Start", hour: 9, min: 0, sec: 0),
        Reminder(title: "Cook Dinner", hour: 19, min: 30, sec: 0),
        Reminder(title: "Sleep", hour: 22, min: 0, sec: 0)
    ]
    
}
