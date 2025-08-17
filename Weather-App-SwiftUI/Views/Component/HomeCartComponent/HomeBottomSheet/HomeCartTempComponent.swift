//
//  HomeCartDetailComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import SwiftUI

struct HomeCartTempComponent: View {
    @StateObject private var viewModel = WeatherListViewModel()
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                // Eğer loading ise
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
                // Eğer hata varsa
                else if let error = viewModel.errorMessage {
                    Text("CartDetail: \(error)")
                }
                // Forecast listesi varsa
                else {
                    ForEach(viewModel.forecastList, id: \.dt) { forecast in
                        VStack(spacing: 10) {
                            // Saat bilgisi
                            Text(formatDateHour(from: forecast.dtTxt)) // "dt_txt" zaten String
                                .font(.caption)
                                .multilineTextAlignment(.center)
                              
                            
                            // Hava ikonu
                            if let icon = forecast.weather.first?.icon {
                                let url = "https://openweathermap.org/img/wn/\(icon)@2x.png"
                                AsyncImage(url: URL(string: url)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                            }
                            
                            // Sıcaklık
                            Text("\((forecast.main.temp.toCelsisu))°C")
                                .font(.footnote)
                                .foregroundStyle(.white)
                        }
                        .frame(width: 60, height: 150)
                        .background(Color.black.opacity(0.06))
                        .cornerRadius(25)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            loadWeatherIfLocationAvailable()
        }
        .onChange(of: locationManager.location) {
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


private func formatDateHour(from dtTxt: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // JSON formatı
    formatter.locale = Locale(identifier: "en_US_POSIX")
    
    if let date = formatter.date(from: dtTxt) {
        formatter.dateFormat = "dd MMM, ha" // gün, ay ve saat
        return formatter.string(from: date) // örn: "17 Aug, 3PM"
    }
    return dtTxt
}
#Preview {
    HomeCartTempComponent()
}
