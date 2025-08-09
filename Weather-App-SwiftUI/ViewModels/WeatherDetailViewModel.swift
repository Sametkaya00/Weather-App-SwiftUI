//
//  WeatherDetailViewModel.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//

import Foundation

class WeatherDetailViewModel:ObservableObject{
    let forecastItem:ForecastItem
    let cityName:String
    
    init(forecestItem: ForecastItem, cityName: String) {
        self.forecastItem = forecestItem
        self.cityName = cityName
    }
    
    var temperature:String{
        "\(Int(forecastItem.main.temp))°C"
    }
    
    var description:String{
        forecastItem.weather.first?.description.capitalized ?? ""
    }
    
    var iconURL: URL? {
        if let icon = forecastItem.weather.first?.icon {
            return URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
        }
        return nil
    }
    
    var dateText: String {
        forecastItem.dtTxt
    }
    
}
