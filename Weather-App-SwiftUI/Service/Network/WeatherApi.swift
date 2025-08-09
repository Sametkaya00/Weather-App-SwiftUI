//
//  WeatherApi.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//

import Foundation
import Alamofire

class WeatherApi:WeatherServiceProtocol{

    private let apiKey = ApiConfig.apiKey
    private let baseURL = ApiConfig.baseUrl
    
    func getForecast(lat: Double, lon: Double, completion: @escaping (Result<ForecastResponse, any Error>) -> Void) {
        let params:Parameters = [
            "lat":lat,
            "lon":lon,
            "appid":apiKey,
            "units":"metric",
            "lang":"tr"
        ]
        AF.request(baseURL,parameters: params)
            .validate()
            .responseDecodable(of:ForecastResponse.self){response in
                switch response.result{
                case .success(let forecast):
                    completion(.success(forecast))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


