//
//  Identifiers.swift
//  Skincare
//
//  Created by Carolina Ortega on 09/12/21.
//

import Foundation

enum NotificationIdentifier: String {
    case Morning = "manha"
    case Afternoon = "tarde"
    case Night = "noite"
}

enum NotificationCategory: String {
    case Alarm = "alarm"
}

enum NotificationPicker: String {
    case MorningHour = "pickerMorningHour"
    case MorningMin = "pickerMorningMin"
    case AfternoonHour = "pickerAfternoonHour"
    case AfternoonMin = "pickerAfternoonMin"
    case NightHour = "pickerNightHour"
    case NightMin = "pickerNightMin"

}

enum FormQuestions: String {
    case Normal = "A"
    case Oily = "B"
    case Seca = "C"
    case Mixed = "D"
}
