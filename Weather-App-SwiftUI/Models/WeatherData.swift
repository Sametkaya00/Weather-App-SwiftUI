//
//  WeatherData.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//

import Foundation

import Foundation

// MARK: - ForecastResponse
struct ForecastResponse: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [ForecastItem]
    let city: City
}

// MARK: - ForecastItem
struct ForecastItem: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int?
    let pop: Double?
    let rain: Rain?
    let sys: Sys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let seaLevel: Int?
    let grndLevel: Int?
    let humidity: Int
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int?
    let gust: Double?
}

// MARK: - Rain
struct Rain: Codable {
    /// corresponds to "3h" in JSON
    let threeHour: Double?

    enum CodingKeys: String, CodingKey {
        case threeHour = "3h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: String?
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population: Int?
    let timezone: Int?
    let sunrise: Int?
    let sunset: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lat: Double
    let lon: Double
}

