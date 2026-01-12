//
//  Models.swift
//  Alarm app
//
//  Created by Bryan Bogran on 1/8/26.
//

import Foundation
import SwiftUI

struct Alarm: Identifiable {
    let id = UUID()
    var time: Date
    var label: String
    var isEnabled: Bool
    var repeatDays: Set<Weekday> = []
    var sound: AlarmSound = .DefaultSound
    var vibrationEnabled: Bool = false
    var color: Color = .blue
    var customMessage: String = "Time to wake up!"
    //var verificationTask: VerificationTask
    
    
    enum Weekday: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        case monday = "Mon"
        case tuesday = "Tue"
        case wednesday = "Wed"
        case thursday = "Thu"
        case friday = "Fri"
        case saturday = "Sat"
        case sunday = "Sun"
    }
    
    enum AlarmSound: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        case DefaultSound = "Default"
        case Birds = "Birds"
        case Waves = "Waves"
        case Chimes = "Chimes"
        case AlarmClock = "AlarmClock"
    }
    
}

enum VerificationTask {
    case Toothbrush
    case bathroom
    case kitchen
    case Toilet
    case steps(count:Int)
}
