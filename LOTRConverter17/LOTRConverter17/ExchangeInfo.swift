//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Juan Camilo Victoria Pacheco on 19/04/24.
//

import SwiftUI

struct ExchangeInfo: View {
    var body: some View {
        ZStack {
            // Background parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                // Description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                // Exchange rates
                ExchangeRate(
                    leftImage: .goldpiece,
                    text: "1 Gold Piece = 4 Gold Pennies",
                    rightImage: .goldpenny)
                
                ExchangeRate(
                    leftImage: .goldpenny,
                    text: "1 Gold Penny = 4 Silver Pieces",
                    rightImage: .silverpiece)
                
                ExchangeRate(
                    leftImage: .silverpiece,
                    text: "1 silver Piece = 4 Silver Pennies",
                    rightImage: .silverpenny)
                
                ExchangeRate(
                    leftImage: .silverpenny,
                    text: "1 Silver Penny = 100 Copper Pennies",
                    rightImage: .copperpenny)
                
                
                // Done button
                Button("Done"){
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
