//
//  WeatherApiProtocol.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//

import Foundation

protocol WeatherServiceProtocol {
    func getForecast(lat:Double,lon:Double, completion: @escaping (Result<ForecastResponse, Error>) -> Void)
}
