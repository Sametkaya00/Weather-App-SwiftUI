//
//  WeatherCityViewModel.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 25.08.2025.
//

import Foundation
@MainActor
class WeatherCityViewModel:ObservableObject {
    @Published var WeatherData : [Weatherr] = []
    @Published var wind : Windd?
    @Published var sys : Syss?
    @Published var main : Mainn?
    @Published var name : String = ""
    @Published var isLoading:Bool = false
    @Published var errorMessage:String?
    
    
    @Published var items : [String] = []
    
    func addNewData(_ data:String){
        items.append(data)
    }
    
    private let api : WearherCityApiProtocol
    init(api:WearherCityApiProtocol = WeatherCityApi()){
        self.api = api
    }
    
    func loadCityPosts(cityName:String) async{
        isLoading = true
        errorMessage = nil
        
        do{
            let response = try await api.fetchCity(cityName: cityName)
            wind = response.wind
            sys = response.sys
            WeatherData = response.weather
            main = response.main
            name = response.name
            
        }catch{
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
