//
//  ReminderRowView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 31/03/2025.
//

import SwiftUI

struct ReminderRowView: View {
    
    let rem: Reminder
    
    var body: some View {
        HStack {
            Text(rem.title)
            
            Spacer()
            
            Text(rem.hour.codingKey.stringValue + ":" + rem.min.codingKey.stringValue + ":" + rem.sec.codingKey.stringValue)
                        
            Spacer()
            
            NavigationLink(destination: ReminderEditView(rem: rem)){
                
            }
        }
        .padding(5)
        .border(Color.blue)
        .frame(width: .infinity)
        .aspectRatio(contentMode: .fill)
    }
}

#Preview {
    ReminderRowView(rem: Reminder.testData[0])
}
