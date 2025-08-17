//
//  WeatherCardComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 10.08.2025.
//

import SwiftUI


struct WeatherCardComponent: View {
    @StateObject private var listViewModel = WeatherListViewModel()
    let lat: Double
    let lon: Double
    var body: some View {
        Image("Rectangle")
            .overlay{
                if listViewModel.isLoading{
                    ProgressView("Loading...")
                }else if let error = listViewModel.errorMessage{
                    Text("Error:\(error)")
                }else if let city = listViewModel.city, !listViewModel.forecastList.isEmpty{
                    let firstForecast = listViewModel.forecastList[0]
                    VStack{
                        Text("\(firstForecast.main.temp.toCelsisu)°")//Dinamik data
                            .foregroundStyle(.white)
                            .bold()
                            .font(.system(size: 55))
                            .position(x:90,y:58)
                    }
                    HStack{
                        if let icon = firstForecast.weather.first?.icon{
                            let url = "https://openweathermap.org/img/wn/\(icon)@2x.png"
                            AsyncImage(url: URL(string: url)) { image in
                                image.resizable()
                            }placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .position(x: 258, y: 25)
                        }
                    }
                    Text(firstForecast.weather.first?.description ?? "")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 13))
                        .position(x: 279, y: 144)
                    Group{
                        HStack{
                            Text("H: \(firstForecast.main.tempMax.toCelsisu)°")
                            Text("L: \(firstForecast.main.tempMin.toCelsisu)°")
                        }
                        .padding(.trailing)
                        .opacity(0.5)
                        .padding(.bottom,50)
                        VStack{
                            Text("\(city.name), \(city.country)")
                        }
                    }
                    .foregroundStyle(.white)
                    .bold()
                    .font(.system(size: 15))
                    .position(x:80,y:144)
                }
            }
            .task {
                await listViewModel.loadPosts(lat: lat, lon: lon)
            }
    }
}

#Preview {
    WeatherCardComponent(lat: 44.34, lon: 10.99)
}
