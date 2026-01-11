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
        ZStack {
            Color(red: 24/255.0, green: 24/255.0, blue: 24/255.0)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Alarms")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(.white)
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 15)
                ForEach($alarms) { $alarm in
                    HStack {
                        VStack(alignment: .leading, spacing: 2.0) {
                            
                            (
                            Text("7:30")
                                .font(.system(size: 60, weight: .regular))
                            +
                            Text(" AM")
                                .font(.system(size: 30, weight: .regular))
                                .baselineOffset(8)
                            )
                                .foregroundStyle(.white)
                            Text(alarm.label)
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        Toggle("", isOn: $alarm.isEnabled)
                    }
                    .padding(10)
                    .background(
                        Rectangle()
                            .foregroundStyle(Color(
                                red: 44/255.0,
                                green: 44/255.0,
                                blue: 46/255.0))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    )
                    .padding(5)
                }
                Spacer()
            }
            .padding(.top, 16)
        }
    }
}

    #Preview {
        ContentView()
    }

