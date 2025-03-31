//
//  AppModel.swift
//  MyAppHealth
//
//  Created by gelin maxence on 31/03/2025.
//

import Foundation

struct AppGroup: Identifiable {
    var id = UUID()
    var name: String
    
    static var testData = [
        AppGroup(name: "Social media"),
        AppGroup(name: "Streaming"),
        AppGroup(name: "Game"),
        AppGroup(name: "Other")
    ]
}

struct AppModel: Identifiable {
    var id = UUID()
    var name: String
    var group: AppGroup
    
    static var testData = [
        AppModel(name: "Instagram", group: AppGroup.testData[0]),
        AppModel(name: "YouTube", group: AppGroup.testData[1]),
        AppModel(name: "TikTok", group: AppGroup.testData[0]),
        AppModel(name: "Netflix", group: AppGroup.testData[1]),
        AppModel(name: "Clash Royale", group: AppGroup.testData[2]),
        AppModel(name: "WhatsApp", group: AppGroup.testData[0]),
        AppModel(name: "Spotify", group: AppGroup.testData[1]),
        AppModel(name: "Candy Crush", group: AppGroup.testData[2]),
        AppModel(name: "Chrome", group: AppGroup.testData[3]),
        AppModel(name: "Gmail", group: AppGroup.testData[3])
    ]
}

struct AppSession: Identifiable {
    var id = UUID()
    var app: AppModel
    var startDate: String
    var duration: Float
    
    static var testData = [
        AppSession(app: AppModel.testData[0], startDate: "2025-03-10", duration: 0.75),
        AppSession(app: AppModel.testData[1], startDate: "2025-03-10", duration: 0.75),
        AppSession(app: AppModel.testData[1], startDate: "2025-03-11", duration: 0.5),
        AppSession(app: AppModel.testData[1], startDate: "2025-03-11", duration: 0.8333),
        AppSession(app: AppModel.testData[4], startDate: "2025-03-12", duration: 0.6667),
        AppSession(app: AppModel.testData[5], startDate: "2025-03-12", duration: 0.75),
        AppSession(app: AppModel.testData[6], startDate: "2025-03-13", duration: 0.6667),
        AppSession(app: AppModel.testData[7], startDate: "2025-03-13", duration: 0.5833),
        AppSession(app: AppModel.testData[8], startDate: "2025-03-14", duration: 0.5833),
        AppSession(app: AppModel.testData[9], startDate: "2025-03-14", duration: 0.6667),
        AppSession(app: AppModel.testData[0], startDate: "2025-03-15", duration: 0.75),
        AppSession(app: AppModel.testData[1], startDate: "2025-03-16", duration: 0.75),
        AppSession(app: AppModel.testData[2], startDate: "2025-03-16", duration: 0.5),
        AppSession(app: AppModel.testData[3], startDate: "2025-03-16", duration: 0.8333),
        AppSession(app: AppModel.testData[4], startDate: "2025-03-17", duration: 0.6667),
        AppSession(app: AppModel.testData[5], startDate: "2025-03-17", duration: 0.75),
        AppSession(app: AppModel.testData[6], startDate: "2025-03-18", duration: 0.6667),
        AppSession(app: AppModel.testData[7], startDate: "2025-03-18", duration: 0.5833),
        AppSession(app: AppModel.testData[8], startDate: "2025-03-19", duration: 0.5833),
        AppSession(app: AppModel.testData[9], startDate: "2025-03-19", duration: 0.6667),
        AppSession(app: AppModel.testData[0], startDate: "2025-03-20", duration: 0.75),
        AppSession(app: AppModel.testData[1], startDate: "2025-03-20", duration: 0.75),
        AppSession(app: AppModel.testData[2], startDate: "2025-03-21", duration: 0.5),
        AppSession(app: AppModel.testData[3], startDate: "2025-03-21", duration: 0.8333),
        AppSession(app: AppModel.testData[4], startDate: "2025-03-22", duration: 0.6667),
        AppSession(app: AppModel.testData[5], startDate: "2025-03-22", duration: 0.75),
        AppSession(app: AppModel.testData[6], startDate: "2025-03-23", duration: 0.6667),
        AppSession(app: AppModel.testData[7], startDate: "2025-03-23", duration: 0.5833),
        AppSession(app: AppModel.testData[8], startDate: "2025-03-24", duration: 0.5833),
        AppSession(app: AppModel.testData[9], startDate: "2025-03-24", duration: 0.6667)
    ]
}
