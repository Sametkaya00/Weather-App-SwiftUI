//
//  HomeCartRainfallComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import SwiftUI

struct HomeCartRainfallComponent: View {
    @StateObject private var viewModel = WeatherListViewModel()
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        Rectangle()
            .foregroundStyle(.black.opacity(0.06))
            .frame(width: 186,height: 186)
            .cornerRadius(20)
            .overlay{
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }else if let error = viewModel.errorMessage {
                    Text("Cart Raingall\(error)")
                }else if !viewModel.forecastList.isEmpty {
                    let firstForecast = viewModel.forecastList[0]
                    VStack{
                        HStack{
                            Image(systemName: "cloud.rain")
                                .foregroundColor(.blue)
                            
                            Text("RAINFALL")
                                .foregroundColor(.black) // Sadece yazı siyah
                                .font(.system(size: 13))
                        }
                        Spacer()
                    }
                    .padding(15)
                    .padding(.trailing,65)
                    VStack{
                        if let rain = firstForecast.rain?.threeHour{
                            Text("\(rain)")
                        }
                        else{
                            Text("Loading...")
                                .foregroundStyle(.white)
                        }
                    }
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
    HomeCartRainfallComponent()
}
