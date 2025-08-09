//
//  WeatherListViewModel.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//
import Foundation

class WeatherListViewModel: ObservableObject {
    @Published var forecasts: [ForecastItem] = []
    @Published var cityName: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let weatherService: WeatherServiceProtocol

    init(weatherService: WeatherServiceProtocol = WeatherApi()) {
        self.weatherService = weatherService
    }

    func fetchWeatherList(lat: Double, lon: Double) {
        isLoading = true
        errorMessage = nil

        weatherService.getForecast(lat: lat, lon: lon) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.forecasts = response.list
                    self?.cityName = response.city.name
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
