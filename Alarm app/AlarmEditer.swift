//
//  AlarmManager.swift
//  Alarm app
//
//  Created by Bryan Bogran on 1/8/26.
//

import Foundation
import SwiftUI

class AlarmEditer: ObservableObject {
    @Published var alarms: [Alarm] = []
    
    // add a new alarm with default settings
    func addAlarm() {
        let newAlarm = Alarm(time: Date(), label: "New Alarm", isEnabled: true)
        alarms.append(newAlarm)
    }
    
    // (C) Quick add Preset alarm (e.g. Wake up at 7:00 AM
    func quickAddPresetAlarm() {
        var comps = DateComponents()
        comps.hour = 7
        comps.minute = 0
        let calendar = Calendar.current
        let morningDate = calendar.date(from: comps) ?? Date()
        let presetAlarm = Alarm(time: morningDate, label: "Morning alarm", isEnabled: true)
        alarms.append(presetAlarm)
        }
        
    
    // update an existing alarm
    func updateAlarm(_ alarm: Alarm) {
        guard let index = alarms.firstIndex(where: {$0.id == alarm.id}) else { return }
        alarms[index] = alarm
    }
    
    // Delete alarm
    func deleteAlarm(at offsets: IndexSet) {
        alarms.remove(atOffsets: offsets)
    }
    
    // Duplicate an existing alarm
    func duplicateAlarm(_ alarm: Alarm) {
        var newAlarm = alarm
        newAlarm.label += "Copy"
        newAlarm.isEnabled = false // duplicate is disabled by default
        alarms.append(newAlarm)
        
        
    }
    
    // (S) Reset all alarms to defaults (for demonstration, just clears all)
    func resetAllAlarms() {
        alarms.removeAll()
        addAlarm() // add default alarm
    }
    
}
