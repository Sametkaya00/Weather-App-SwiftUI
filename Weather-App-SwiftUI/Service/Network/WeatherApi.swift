//
//  WeatherApi.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//

import Foundation

class WeatherApi:WeatherApiProtocol{
    private let apiKey:String = "db70f0bff8cdc000b716f2414ba5e41a"
    
    func fetchPosts(lat: Double, lon: Double) async throws -> ForecastResponse{
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else{throw URLError(.badURL)}
        
        
        let (data , response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {throw URLError(.badServerResponse)}
        
        let posts = try JSONDecoder().decode(ForecastResponse.self, from: data)
        
        return posts
    }
}



