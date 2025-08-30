//
//  SearchComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 10.08.2025.
//

import SwiftUI

struct SearchComponent: View {
    @StateObject var viewModel = WeatherCityViewModel()
    @State var searchText: String
    @State var cityPrototip:String = ""
    
    var body: some View {
        VStack{
            HStack {
                
                Button {
                    cityPrototip = searchText
                   
                    viewModel.addNewData(cityPrototip)
                    searchText = ""
                 
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundStyle(.blue)
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                }

              
                
                TextField("Search", text: $searchText)
                
            }
          
            
            .padding(.horizontal, 10)
            .frame(width: 350, height: 40)
            .background(.white)
            .cornerRadius(10)
            .padding()
            ScrollView{
                VStack{
                    ForEach(viewModel.items, id:\.self){city in
                        if !city.isEmpty{
                            WeatherCardComponent(cityName: city)
                        }
                       
                    }
                    .padding(.horizontal)
                }
            }
            
         
        }
        Spacer()
    }
}
#Preview{
    SearchComponent(searchText: "")
}
