//
//  SwiftUIView.swift
//  MyAppHealth
//
//  Created by gelin maxence on 18/02/2025.
//

import SwiftUI
import Charts

struct MainView: View {
    @StateObject private var homeDataVM = HomeDataViewModel()
    
    let graphTypes = ["Bar", "Line"]
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Your Activity")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
                    .bold()
                    .padding(15)
                
                Spacer()
                
                Picker("Type de graphique", selection: $homeDataVM.selectedGraphType) {
                    ForEach(graphTypes, id: \.self) { graph in
                        Text(graph)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if homeDataVM.selectedGraphType == "Bar" {
                    barChartView()
                } else if homeDataVM.selectedGraphType == "Line" {
                    lineChartView()
                }
                
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func barChartView() -> some View {
        Chart(homeDataVM.sortedDays, id: \.self) { day in
            BarMark(
                x: .value("Jour", day),
                y: .value("Durée", min(homeDataVM.timeForDay(day), 24))
            )
        }
        .frame(height: 280)
        .padding()
        .chartYAxis {
            AxisMarks(position: .leading, values: [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24]) { value in
                AxisGridLine()
                AxisTick()
                AxisValueLabel {
                    if let duration = value.as(Int.self) {
                        Text("\(duration)h")
                    }
                }
            }
        }
        .padding(.vertical, 17)
    }
    
    @ViewBuilder
    private func lineChartView() -> some View {
        Chart {
            ForEach(homeDataVM.sortedDays, id: \.self) { day in
                if let duration = homeDataVM.timeData[day] {
                    LineMark(
                        x: .value("Jour", day),
                        y: .value("Durée", min(duration, 24))
                    )
                }
            }
        }
        .frame(height: 280)
        .padding()
        .chartYAxis {
            AxisMarks(position: .leading, values: [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24]) { value in
                AxisGridLine()
                AxisTick()
                AxisValueLabel {
                    if let duration = value.as(Int.self) {
                        Text("\(duration)h")
                    }
                }
            }
        }
        .padding(.vertical, 17)
    }
}
            
            
            

#Preview {
    MainView()
}
