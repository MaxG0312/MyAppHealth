import SwiftUI
import Charts

struct MainAppView: View {
    @StateObject private var viewModel = AppDataViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Your Activity")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle)
                .bold()
                .padding(15)
            
            Spacer()
            
            Picker("Afficher par", selection: $viewModel.groupByApp) {
                Text("Application").tag(true)
                Text("Groupe").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Chart(viewModel.groupedData, id: \.0) { name, duration in
                BarMark(
                    x: .value("Durée", duration),
                    y: .value("Nom", name)
                )
                .foregroundStyle(.blue)
            }
            .frame(height: 300)
            .padding()
            .chartXAxis {
                AxisMarks(position: .bottom) { value in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel() {
                        if let duration = value.as(Float.self) {
                            Text(String(format: "%.1f h", duration))
                        }
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            Spacer()
        }
    }
}

#Preview {
    MainAppView()
}
