//
//  ToTimeString.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import Foundation

extension Int{
    func ToTimeString() -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.timeZone = TimeZone.current
        return formatter.string(from: date)
        
    }
}
