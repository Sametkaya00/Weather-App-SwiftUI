//
//  HomeCartComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import SwiftUI

struct HomeCartComponent: View {
    @State private var offsetY: CGFloat = 0
    @State private var cardPosition: CardPosition = .half
    var body: some View {
        NavigationStack {
            GeometryReader{ geometry in
                ZStack{
                    VStack{
                        Spacer()
                        //Kart
                        VStack{
                            Capsule()
                                .frame(width: 40,height: 6)
                                .foregroundStyle(.black)
                                .padding(.top,8)
                            ScrollView{
                                if cardPosition == .full{
                                    let columns = [
                                        GridItem(.flexible()), // Birinci sütun
                                        GridItem(.flexible())  // İkinci sütun
                                    ]
                                    LazyVGrid(columns: columns, spacing: 16) {
                                        HomeCartRainfallComponent()
                                        HomeCartSunriseComponent()
                                        
                                        HomeCartWindComponent()
                                    }
                                    .padding()
                                }else{
                                    GeometryReader{ geo in
                                        HomeCartTempComponent()
                                            .position(x:geo.size.width / 2, y:geo.size.height / 2)
                                    }
                                    .frame(height:270)
                                    
                                    
                                    NavigationLink(destination:WeatherListView()){
                                        Image(systemName: "magnifyingglass.circle")
                                            .font(.system(size: 41))
                                            .foregroundStyle(.white)
                                    }
                                }
                            }
                            Spacer()
                        }
                        .frame(height: geometry.size.height * 1)//card size
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .opacity(1.2)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .offset(y: geometry.size.height * cardPosition.rawValue + offsetY)
                        .animation(.spring(), value: cardPosition)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    offsetY = value.translation.height
                                }
                                .onEnded { value in
                                    if value.translation.height < -100 {
                                        cardPosition = .full
                                    } else if value.translation.height > 100 {
                                        cardPosition = .half
                                    }
                                    offsetY = 0
                                }
                        )
                    }
                }
            }
        }
    }
}
enum CardPosition: CGFloat {
    case full = 0.15   // Ekranın %15’i boş kalsın
    case half = 0.55   // Yarım ekran
}
#Preview {
    HomeCartComponent()
}
