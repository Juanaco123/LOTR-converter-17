//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Juan Camilo Victoria Pacheco on 19/04/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            // left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate text
            Text(LocalizedStringKey(text))
            
            // Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(
        leftImage: .silverpiece,
        text: "1 Silver Piece = 4 Silver Pennies",
        rightImage: .silverpenny
    )
}
