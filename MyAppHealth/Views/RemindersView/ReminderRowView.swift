//
//  ReminderRowView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 31/03/2025.
//

import SwiftUI

struct ReminderRowView: View {
    @StateObject var remVM: ReminderViewModel
    
    let rem: Reminder
    
    var body: some View {
        HStack {
            Text(rem.title)
            
            Spacer()
            
            Text(rem.hour.codingKey.stringValue + ":" + rem.min.codingKey.stringValue + ":" + rem.sec.codingKey.stringValue)
                        
            Spacer()
            
            NavigationLink(destination: ReminderEditView(rem: rem, remVM: remVM)){
                
            }
        }
        .padding(5)
        .border(Color.blue)
        .aspectRatio(contentMode: .fill)
    }
}
