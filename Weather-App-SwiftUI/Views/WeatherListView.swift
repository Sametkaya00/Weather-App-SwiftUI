//
//  WeatherListView.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 9.08.2025.
//

import SwiftUI

struct WeatherListView: View {
    @StateObject private var viewModel = WeatherCityViewModel()
  
   
    var body: some View {
        ZStack{
            Color("BacgroundColor")
                .ignoresSafeArea()
            VStack{
                
                SearchComponent(searchText: "")
           
                }
          
         Spacer()
            }
        }
    }

#Preview {
    WeatherListView()
}
