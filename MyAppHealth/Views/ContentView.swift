//
//  ContentView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 18/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            MainAppView()
                .tabItem {
                    Label("Apps", systemImage: "app")
                }
            MainRemindersView()
                .tabItem {
                    Label("Reminders", systemImage: "clock")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ReminderViewModel())
}
