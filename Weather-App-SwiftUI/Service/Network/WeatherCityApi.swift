//
//  WeatherCityApi.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 25.08.2025.
//

import Foundation

struct WeatherCityApi:WearherCityApiProtocol {
    func fetchCity(cityName: String) async throws -> CityResponse {
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(ApiConfig.apiKey)&units=metric") else{throw URLError(.badURL)}
        
        let (data ,response) = try await URLSession.shared.data(from: url)
        
        guard let httpRequest = response as? HTTPURLResponse , httpRequest.statusCode == 200 else{throw URLError(.badServerResponse)}
            
            let postsCity = try JSONDecoder().decode(CityResponse.self,from: data)
       
            return postsCity
        }   
}
