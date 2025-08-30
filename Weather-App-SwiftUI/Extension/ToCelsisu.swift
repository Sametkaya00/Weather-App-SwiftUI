//
//  ToCelsisu.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import Foundation
extension Double{
    var toCelsisu:String{
        return String(format: "%.0f", self - 273.15)
    }   
}
extension Double {
    var noFraction: String { String(format: "%.0f", self) }
}
