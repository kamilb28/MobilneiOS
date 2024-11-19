//
//  ContentView.swift
//  Lab1_ex2
//
//  Created by kbernacik kbernacik on 19/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast(day: "Mon", isRainy: false, high:20, low:15)
            
            DayForecast(day: "Tue", isRainy: true, high:18, low:12)
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {return "cloud.rain.circle.fill"}
        else {return "sun.max.circle.fill"}
    }
    
    var iconColor: Color {
        if isRainy {return Color.blue}
        else {return Color.yellow}
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(day)
                    .font(Font.largeTitle)
                Image(systemName: iconName)
                    .imageScale(.large)
                    .foregroundStyle(iconColor)
                    .font(Font.largeTitle)
            }
            Text("High: \(high)ºC")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)ºC")
                .fontWeight(Font.Weight.semibold)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}
