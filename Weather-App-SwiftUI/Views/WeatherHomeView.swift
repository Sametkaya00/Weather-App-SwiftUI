//
//  WeatherDetailView.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//

import SwiftUI

struct WeatherHomeView: View {
    var body: some View {
        NavigationStack{
            ZStack{
              HomeBacgroundComponent()
              HomeCartComponent()
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    WeatherHomeView()
}
