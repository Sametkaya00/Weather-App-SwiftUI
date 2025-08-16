//
//  WeatherListViewModel.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//
import Foundation

@MainActor
class WeatherListViewModel:ObservableObject{
    @Published var forecastList:[ForecastItem] = []
    @Published var city : City?
    @Published var isLoading:Bool = false
    @Published var errorMessage:String?
    
    private let api:WeatherApiProtocol
    
    init(api:WeatherApiProtocol = WeatherApi()){
        self.api = api
    }
    
    func loadPosts(lat: Double, lon: Double) async{
        isLoading = true
        errorMessage = nil
        
        do{
            let response = try await api.fetchPosts(lat: lat, lon: lon)
            city = response.city
            
            forecastList = response.list
        }catch{
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    
}
