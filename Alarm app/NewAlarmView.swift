import SwiftUI

struct NewAlarmView: View {
    @Environment(\.dismiss) private var dismiss

    @State var alarm: Alarm

    let onSave: (Alarm) -> Void
    let weekdays = Alarm.Weekday.allCases
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Time")) {
                    DatePicker("", selection: $alarm.time, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                }

                Section(header: Text("Label")) {
                    TextField("Alarm label", text: $alarm.label)
                }
                
                Section(header: Text("Repeat Days")) {
                    ForEach(weekdays) { day in
                        Toggle(day.rawValue, isOn: Binding(
                            get: { alarm.repeatDays.contains(day) },
                            set: { isSelected in
                                if isSelected {
                                    alarm.repeatDays.insert(day)
                                } else {
                                    alarm.repeatDays.remove(day)
                                }
                            }
                        ))
                        .tint(.blue)
                    }
                }
                
                Section(header: Text("Alarm Sound")) {
                    Picker("Sound", selection: $alarm.sound) {
                        ForEach(Alarm.AlarmSound.allCases) { sound in
                            Text(sound.rawValue).tag(sound)
                        }
                    }
                }
            }
            .navigationTitle("New Alarm")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newAlarm = Alarm(
                            time: alarm.time,
                            label: alarm.label.isEmpty ? "Alarm" : alarm.label,
                            isEnabled: alarm.isEnabled,
                            repeatDays: alarm.repeatDays
                        )
                        onSave(newAlarm)
                        dismiss()
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    let defaultSound = Alarm.AlarmSound.allCases.first!
    return NewAlarmView(alarm: Alarm(time: Date(), label: "Alarm", isEnabled: true, repeatDays: [], sound: defaultSound)) { _ in }
}
