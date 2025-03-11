//
//  MainRemindersView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 11/03/2025.
//

import SwiftUI

struct MainRemindersView: View {
    var body: some View {
        VStack {
            Text("Your Reminders")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.blue)
                .padding(15)
            
            VStack {
                HStack {
                    Text("Lorem Ipsum")
                    
                    Spacer()
                    
                    Image(systemName: "pencil")
                    
                    Image(systemName: "trash")
                        .foregroundStyle(Color.red)
                }
                .padding(5)
                .border(Color.blue)
                .frame(width:250)
                .aspectRatio(contentMode: .fill)
            }
            
            Spacer()
            
            Button{
                
            } label: {
                Text("Add New")
                    .padding(5)
            }
            .frame(width: 250)
            .clipShape(Rectangle())
                .border(.gray)
            
            
            Spacer()
            
            
            
            Spacer()
            
            Rectangle()
                .frame(height: 75)
                .foregroundStyle(.gray)
                .padding([.top],15)
        }
    }
}

#Preview {
    MainRemindersView()
}
