//
//  HomeCartSunriseComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import SwiftUI

struct HomeCartSunriseComponent: View {
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
                }
                else if let error = viewModel.errorMessage{
                    Text("Sunrise: \(error)")
                } else{
                    VStack(alignment:.leading){
                        HStack{
                            Image(systemName:"sunrise.fill")
                                .foregroundStyle(.yellow)
                            Text("SUNRISE")
                        }
                        .font(.system(size:13))
                        
                        if let sunset = viewModel.city?.sunset{
                            Text("\(sunset.ToTimeString())")
                                .font(.system(size: 35))
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        if let sunrase = viewModel.city?.sunrise{
                            HStack{
                                Text("Sunset:")
                                Text("\(sunrase.ToTimeString())")
                                    .foregroundStyle(.white)
                            }
                            
                        }
                    }
                    .padding(15)
                    .padding(.trailing,40)
                }
            }
            .onAppear(){
                loadWeatherLocationAvaible()
            }
            .onChange(of: locationManager.location){
                loadWeatherLocationAvaible()
            }
    }
    private func loadWeatherLocationAvaible(){
        guard let loc = locationManager.location else {return}
        Task() {
            await viewModel.loadPosts(lat: loc.coordinate.latitude, lon: loc.coordinate.longitude)
        }
    }
}

#Preview {
    HomeCartSunriseComponent()
}
