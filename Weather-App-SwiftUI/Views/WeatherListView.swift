//
//  WeatherListView.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//

import SwiftUI

struct WeatherListView: View {
    let cities = [
        (lat: 41.01, lon: 28.96), // İstanbul
        (lat: 39.92, lon: 32.85), // Ankara
        (lat: 38.42, lon: 27.14), // İzmir
        (lat: 37.87, lon: 32.48), // Konya
        (lat: 40.76, lon: 29.94), // Bursa
        (lat: 41.63, lon: 26.54), // Edirne
        (lat: 37.45, lon: 30.33), // Antalya
        (lat: 40.99, lon: 29.12), // Sakarya
        (lat: 36.91, lon: 30.70), // Mersin
        (lat: 40.22, lon: 27.88), // Balıkesir
        (lat: 39.77, lon: 30.56), // Eskişehir
        (lat: 41.28, lon: 36.33), // Trabzon
        (lat: 38.42, lon: 27.13), // Aydın
        (lat: 37.57, lon: 34.75), // Adana
        (lat: 38.42, lon: 27.13),  // Denizli
        
    ]
    var body: some View {
        ZStack{
            Color("BacgroundColor")
                .ignoresSafeArea()
            VStack{
                SearchComponent()
                    .safeAreaInset(edge: .top) {
                        Color.clear.frame(height: 30) // Boşluk bırakır
                    }
                
                ScrollView{
                    ForEach(cities.indices, id:\.self){index in
                        WeatherCardComponent(lat: cities[index].lat, lon: cities[index].lon)
                            .padding()
                    }
                    .padding(.bottom,10)
                }
            }
        }
    }
}

#Preview {
    WeatherListView()
}
