//
//  ContentView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 18/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var hour: Int = 0
    @State private var min: Int = 30
    @State private var sec: Int = 25
    var body: some View {
        NavigationStack {
            VStack {
                TimePicker(hour: $hour, min: $min, sec: $sec)
                    .padding(15)
                    .background(.white, in: .rect(cornerRadius: 10))
                    .padding(.horizontal, 20)
            }
            .padding(15)
            .navigationTitle("Custom Time Picker")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.15))
        }
    }
}

#Preview {
    ContentView()
}
