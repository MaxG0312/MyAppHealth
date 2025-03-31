//
//  MainRemindersView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 11/03/2025.
//

import SwiftUI

struct MainRemindersView: View {
    
    // var data: [Todo]
    @EnvironmentObject var remVM: ReminderViewModel
    
    var body: some View {
        // barre de navigation pour edit et add et page d'accueil
        NavigationView {
            // tâches sous forme de liste
            List {
                ForEach(remVM.reminders) {
                    // appel du "composant/slot"
                    reminder in ReminderRowView(rem: reminder)
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
