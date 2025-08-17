//
//  SearchComponent.swift
//  Weather-App-SwiftUI
//
//  Created by samet kaya on 10.08.2025.
//

import SwiftUI

struct SearchComponent: View {
    @State private var SearchText: String = ""
    var body: some View {
        TextField(text: $SearchText) {
            Text("Search")
                .foregroundStyle(.black)
                .font(.system(size: 13))
        }
        .frame(width: 350, height: 40)
        .background(.white.opacity(0.4))
        .cornerRadius(10)
        .padding()
       
    }
}

#Preview {
    SearchComponent()
}
