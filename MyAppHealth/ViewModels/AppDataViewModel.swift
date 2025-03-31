//
//  AppDataViewModel.swift
//  MyAppHealth
//
//  Created by gelin maxence on 31/03/2025.
//

import Foundation

class AppDataViewModel: ObservableObject {
    @Published var sessions: [AppSession] = AppSession.testData
    @Published var groupByApp: Bool = true
    
    var groupedData: [(String, Float)] {
        let data: [String: Float]
        
        if groupByApp {
            data = Dictionary(grouping: sessions, by: { $0.app.name })
                .mapValues { $0.reduce(0) { $0 + $1.duration } }
        } else {
            data = Dictionary(grouping: sessions, by: { $0.app.group.name })
                .mapValues { $0.reduce(0) { $0 + $1.duration } }
        }
        
        return data.sorted { $0.1 > $1.1 }
    }
}
