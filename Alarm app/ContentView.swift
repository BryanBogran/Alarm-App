//
//  ContentView.swift
//  Alarm app
//
//  Created by Bryan Bogran on 1/7/26.
//

import SwiftUI

struct ContentView: View {

    @State private var alarms: [Alarm] = [
        Alarm(
            time: Date(),
            label: "Wake up, Brush Teeth",
            isEnabled: true,
            repeatDays: [],
            )
    ]
    
    var body: some View {
        ForEach($alarms) { $alarm in
            ZStack {
                Color(.white)
                .ignoresSafeArea()
                
                HStack {
                VStack(alignment: .leading, spacing: 2.0) {
                    Text("7:30")
                            .font(.system(size: 50, weight: .regular))
                        Text(alarm.label)
                    }
                    Spacer()
                    Toggle("", isOn: $alarm.isEnabled)
                }
                .padding(10)
                .background(Rectangle()
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5))
                .padding(5)
            }
        }
    }
}

    #Preview {
        ContentView()
    }

