//
//  AppDataViewModel.swift
//  MyAppHealth
//
//  Created by gelin maxence on 31/03/2025.
//

import Foundation

class HomeDataViewModel: ObservableObject {

    
    //
    //  VARIABLES
    //

    @Published var timeData: [String: Float] = [:]
    @Published var selectedGraphType: String = "Bar"
    @Published var todayUsage: Float = 0
    @Published var yesterdayUsage: Float = 0
    @Published var topAppsToday: [(String, Float)] = []

    private var timeUsageData: [AppSession] = []
    let daysOfWeek = ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"]


    init() {
        loadTimeData()
    }



    //
    //  INITIALISATION
    //

    func loadTimeData() {
        timeUsageData = AppSession.testData
        calculateData()
    }

    
    
    //
    //  VARIABLES
    //
    
    // Tri des jours en fonction de l'ordre dans daysOfWeek
        var sortedDays: [String] {
            return daysOfWeek.sorted { day1, day2 in
                guard let index1 = daysOfWeek.firstIndex(of: day1),
                      let index2 = daysOfWeek.firstIndex(of: day2) else { return false }
                return index1 < index2
            }
        }
    


    //
    //  METHODES
    //
    
    // Permet de récupérer le temps total pour un jour donné
        func timeForDay(_ day: String) -> Float {
            return timeData[day] ?? 0
        }

    // Permet de mettre a jour l'intégralité des data
    func calculateData() {
        generateWeeklyData()
        calculateDailyUsage()
    }

    // Trouver le nombre d'heures d'écran par jour
    private func generateWeeklyData() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            let groupedByDay = Dictionary(grouping: timeUsageData, by: { timeEntry -> String? in
                if let date = dateFormatter.date(from: timeEntry.startDate) {
                    let dayIndex = Calendar.current.component(.weekday, from: date) - 2
                    return dayIndex >= 0 ? daysOfWeek[dayIndex] : daysOfWeek[6]
                }
                return nil
            })

            // Remplir le dictionnaire timeData avec les données
            timeData = daysOfWeek.reduce(into: [String: Float]()) { result, day in
                let totalHours = groupedByDay[day]?.reduce(0) { $0 + $1.duration } ?? 0
                result[day] = totalHours
            }
        }


    // Définit plusieurs variables (todayUsage, yesterdayUsage, topAppsToday)
    private func calculateDailyUsage() {
        let sortedDates = timeUsageData.map { $0.startDate }.sorted(by: >)
        guard let latestDate = sortedDates.first else { return }
        
        let todayData = timeUsageData.filter { $0.startDate == latestDate }
        todayUsage = todayData.reduce(0) { $0 + $1.duration }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let latestDateObject = dateFormatter.date(from: latestDate) {
            if let yesterdayObject = Calendar.current.date(byAdding: .day, value: -1, to: latestDateObject) {
                let yesterdayFormatted = dateFormatter.string(from: yesterdayObject)

                let yesterday = timeUsageData.filter { $0.startDate == yesterdayFormatted }
                yesterdayUsage = yesterday.reduce(0) { $0 + $1.duration }
            } else {
                yesterdayUsage = 0
            }
        }
        
        topAppsToday = todayData
            .sorted { $0.duration > $1.duration }
            .map { ($0.app.name, $0.duration) }
    }
}
