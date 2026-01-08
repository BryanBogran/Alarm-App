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
            repeatDays: [monday,tuesday, wednesday, thursday, friday, saturday, sunday]
            verificationTask: .Toothbrush)
    ]
    
    var body: some View {
        ZStack {
            HStack() {
                Color(.black)
                    .ignoresSafeArea()
                // Left side: Time + Label
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("7:30")
                        .font(.system(size: 50, weight: .thin))
                }
            }
            
            ForEach($alarms) { $alarm in
                HStack {
                    VStack(alignment: .leading) {
                        Text(alarm.label)
                    }
                    Spacer()
                    Toggle("", isOn: $alarm.isEnabled)
                        .labelsHidden()
                }
            }
            
            Spacer() // Pushes toggle to the right
            
            // Right side Toggle switch
            //Toggle("On", isOn: $alarms.isEnabled)
                
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        
        
    }
    
}
    #Preview {
        ContentView()
    }

