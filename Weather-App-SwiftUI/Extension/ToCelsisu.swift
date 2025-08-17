//
//  ToCelsisu.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import Foundation
extension Double{
    var toCelsisu:String{
        return String(format: "%.1f", self - 273.15)
    }
}
