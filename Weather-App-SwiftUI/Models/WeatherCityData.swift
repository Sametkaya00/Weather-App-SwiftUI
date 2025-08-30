//
//  WeatherCityData.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 25.08.2025.
//

import Foundation

struct CityResponse: Codable {
    let name: String
    let weather: [Weatherr]
    let main: Mainn
    let wind: Windd
    let sys: Syss
}

struct Weatherr: Codable {
    let main: String
    let description: String
    let icon: String
}

struct Mainn: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct Windd: Codable {
    let speed: Double
    let deg: Int
}

struct Syss: Codable {
    let country: String
    let sunrise: Int?
    let sunset: Int?
}
