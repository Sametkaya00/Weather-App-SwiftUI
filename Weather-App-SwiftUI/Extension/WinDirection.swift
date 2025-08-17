//
//  WinDirection.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import Foundation
extension Int {
    var windDirection: String {
        switch self {
        case 0..<23, 338...360: return "N"
        case 23..<68: return "NE"
        case 68..<113: return "E"
        case 113..<158: return "SE"
        case 158..<203: return "S"
        case 203..<248: return "SW"
        case 248..<293: return "W"
        case 293..<338: return "NW"
        default: return "N/A"
        }
    }
}
