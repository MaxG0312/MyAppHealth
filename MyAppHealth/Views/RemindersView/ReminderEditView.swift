//
//  ReminderEditView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 19/03/2025.
//

import SwiftUI

struct ReminderEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var remVM: ReminderViewModel
    
    @State var hour: Int = 0
    @State var min: Int = 0
    @State var sec: Int = 0
    @State var reminderTitle: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter the name of ther reminder", text: $reminderTitle)
                                .padding(.horizontal)
                                .frame(height: 55)
                                .background(Color(.systemGray4))
                                .cornerRadius(10)
                
                TimePicker(hour: $hour, min: $min, sec: $sec)
                    .padding(15)
                    .background(.white, in: .rect(cornerRadius: 10))
                    .padding(.horizontal, 20)
                
                Button {
                                self.remVM.addReminder(reminder: Reminder(title: reminderTitle, hour: hour, min: min, sec: sec))
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("SAVE")
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                    .frame(height: 55)
                                    // equivalent du 100vw
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor)
                                    .cornerRadius(10)
                                
                            }
                            Spacer()
            }
            .padding(15)
            .navigationTitle("Reminder Edit")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.15))
        }
    }
}

#Preview {
    ReminderEditView()
}
