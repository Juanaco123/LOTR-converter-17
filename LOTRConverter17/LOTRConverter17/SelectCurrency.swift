//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Juan Camilo Victoria Pacheco on 20/04/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    let topCurrencyKey = "TopCurrency"
    let bottomCurrencyKey = "BottomCurrency"
    
    var body: some View {
        ZStack {
            // Parchment background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Text
                Text("SelectCurrency.StartCurrency")
                    .fontWeight(.bold)
                
                // Currency icons
                IconGrid(selectedCurrency: $topCurrency)
                
                // Text
                Text("SelectCurrency.CurrencyToConvert")
                    .fontWeight(.bold)
                
                // Currency icons
                IconGrid(selectedCurrency: $bottomCurrency)
                
                // Done button
                Button("SelectCurrency.buttonLabel"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .onDisappear {
            UserDefaults.standard.set(topCurrency.rawValue, forKey: topCurrencyKey)
            UserDefaults.standard.set(bottomCurrency.rawValue, forKey: bottomCurrencyKey)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece))
}
