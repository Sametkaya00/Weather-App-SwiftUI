//
//  HomeCartWindComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import SwiftUI

struct HomeCartWindComponent: View {
    @StateObject private var viewModel = WeatherListViewModel()
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        Rectangle()
            .foregroundStyle(.black.opacity(0.06))
            .frame(width: 186,height: 186)
            .cornerRadius(20)
            .overlay{
                if viewModel.isLoading{
                    ProgressView("Loading...")
                }else if let error = viewModel.errorMessage{
                    Text("CartWind: \(error)")
                }else if !viewModel.forecastList.isEmpty{
                    let firstForecast = viewModel.forecastList[0]
                    VStack(alignment:.leading){
                        Text("\(Image(systemName:"wind")) Wind")
                            .font(.system(size:13))
                        Spacer()
                    }
                    .padding(15)
                    .padding(.trailing,75)
                    
                    VStack{
                        Text("\(firstForecast.wind.speed,specifier: "%.2f")")
                            .font(.system(size: 25,weight: .bold))
                            .foregroundStyle(.white)
                        Text("km/h")
                            .font(.system(size: 22))
                            .foregroundStyle(.white)
                    }
                    VStack(alignment:.leading){
                        Spacer()
                        if let deg = firstForecast.wind.deg{
                            Text("Direction: \(deg.windDirection)°")
                        }
                    }
                    .padding()
                    .padding(.trailing,30)
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
    HomeCartWindComponent()
}
