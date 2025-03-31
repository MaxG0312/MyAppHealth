//
//  MainRemindersView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 11/03/2025.
//

import SwiftUI

struct MainRemindersView: View {
    
    @StateObject var remVM = ReminderViewModel()
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(remVM.reminders) {
                    reminder in ReminderRowView(remVM: remVM, rem: reminder)
                }
                .onDelete(perform: remVM.deleteReminder)
                .onMove(perform: remVM.moveReminder)
            }
            
            .listStyle(PlainListStyle())
            .navigationTitle("Your reminders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add", destination: ReminderAddView())
                }
            }
        }
    }
}

#Preview {
    MainRemindersView()
        .environmentObject(ReminderViewModel())
}
