//
//  SwiftUIView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 18/02/2025.
//

import SwiftUI

struct MainAppView: View {
    var body: some View {
        VStack {
            Text("Your Apps")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.blue)
                .padding(15)
            
            Image(systemName: "rectangle.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .foregroundStyle(.gray)
                .padding(15)
            
            
            HStack(spacing: 0) {
                Button{
                    
                } label: {
                    Text("Week")
                        .padding(5)
                }
                .clipShape(Rectangle())
                    .border(.gray)
                Button{
                    
                } label: {
                    Text("Month")
                        .padding(5)
                }
                    .clipShape(Rectangle())
                    .border(.gray)
                Button{
                    
                } label: {
                    Text("Year")
                        .padding(5)
                }
                    .clipShape(Rectangle())
                    .border(.gray)
            }
            
            Spacer()
            
            Group {
                Text("XX Hours on App1 this week")
                Text("XX Hours on App2 this week")
                Text("XX Hours on App3 this week")
            }
            .font(.title)
            .padding([.top],15)
            
            
            Spacer()
            
            Rectangle()
                .frame(height: 75)
                .foregroundStyle(.gray)
                .padding([.top],15)
        }
    }
}

#Preview {
    MainAppView()
}
