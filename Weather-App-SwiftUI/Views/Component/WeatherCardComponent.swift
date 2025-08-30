//
//  WeatherCardComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 10.08.2025.
//

import SwiftUI


struct WeatherCardComponent: View {
    @StateObject private var listViewModel = WeatherCityViewModel()
    let cityName: String
    
    
    
    var body: some View {
        Image("Rectangle")
            .overlay{
                    if listViewModel.isLoading{
                        ProgressView("Loading...")
                    }else if let error = listViewModel.errorMessage{
                        Text("Error:\(error)")
                    }else if let listMainData = listViewModel.main,
                             let weatherData = listViewModel.WeatherData.first,
                             let sysData = listViewModel.sys{
                        
                        VStack{
                            Text("\(listMainData.temp.noFraction)°")//Dinamik data
                                .foregroundStyle(.white)
                                .bold()
                                .font(.system(size: 55))
                                .position(x:60,y:58)
                        }
                        HStack{
                            let icon = weatherData.icon
                            let url = "https://openweathermap.org/img/wn/\(icon)@2x.png"
                            AsyncImage(url: URL(string: url)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .position(x: 258, y: 25)
                        }
                        Text(weatherData.description)
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 13))
                            .position(x: 279, y: 144)
                        Group{
                            HStack{
                                Text("H: \(listMainData.tempMin.noFraction)°")
                                Text("L: \(listMainData.tempMax.noFraction)°")
                            }
                            .padding(.trailing)
                            .opacity(0.5)
                            .padding(.bottom,50)
                            VStack{
                                Text("\(listViewModel.name), \(sysData.country)")
                            }
                        }
                        .foregroundStyle(.white)
                        .bold()
                        .font(.system(size: 15))
                        .position(x:80,y:144)
                    }
                }
            
            .task {
                await listViewModel.loadCityPosts(cityName: cityName)
            }
    }
}

#Preview {
    WeatherCardComponent(cityName:"Kocaeli")
}

//Gelen veri ile data modelimiz uyuşmuyor bakarsın.
