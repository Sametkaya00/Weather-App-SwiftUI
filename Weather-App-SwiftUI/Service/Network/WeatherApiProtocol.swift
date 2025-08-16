//
//  WeatherApiProtocol.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//

import Foundation

protocol WeatherApiProtocol {
    func fetchPosts(lat:Double,lon:Double) async throws -> ForecastResponse
}
