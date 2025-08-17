//
//  HomeHeaderTempComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import SwiftUI

struct HomeHeaderTempComponent: View {
    @StateObject private var viewModel = WeatherListViewModel()
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        VStack{
            if viewModel.isLoading {
                ProgressView("Loading...")
            }else if let error = viewModel.errorMessage {
                Text("HeaderComponent: \(error)")
            }else if let city = viewModel.city,!viewModel.forecastList.isEmpty{
                let firstForecast = viewModel.forecastList[0]
                VStack{
                    Text(city.name)
                        .font(.title)
                        .foregroundStyle(.white)
                    if let temp = Double(firstForecast.main.temp.toCelsisu) {
                        Text("\(temp, specifier: "%.1f")°")
                            .font(.system(size: 74))
                            .foregroundStyle(.white)
                    }
                    Text(firstForecast.weather.first?.description ?? "")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .bold()
                .font(.system(size: 13))
                HStack{
                    Text("H: \(firstForecast.main.tempMax.toCelsisu)°")
                    Text("L: \(firstForecast.main.tempMin.toCelsisu)°")
                }
                .padding()
                .foregroundStyle(.white)
            }
        }
        .onAppear(){
            loadWeatherIfLocationAvailable()
        }
        .onChange(of: locationManager.location){
            loadWeatherIfLocationAvailable()
        }
    }
    
    // MARK: - Helper
    private func loadWeatherIfLocationAvailable() {
        guard let loc = locationManager.location else { return }
        Task {
            await viewModel.loadPosts(lat: loc.coordinate.latitude, lon: loc.coordinate.longitude)
        }
    }    
}

#Preview {
    HomeHeaderTempComponent()
}
