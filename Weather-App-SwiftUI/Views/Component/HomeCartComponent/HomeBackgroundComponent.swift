//
//  HomeBacgroundComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 17.08.2025.
//

import SwiftUI

struct HomeBacgroundComponent: View {
    var body: some View {
       
        VStack{
            HomeHeaderTempComponent()
            Image("House")
                .padding(.bottom,100)
        }
            .background(Image("background"))
            .ignoresSafeArea()
    }
}

#Preview {
    HomeBacgroundComponent()
}
