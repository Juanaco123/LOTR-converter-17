//
//  ConversionSection.swift
//  LOTRConverter17
//
//  Created by Juan Camilo Victoria Pacheco on 26/04/24.
//

import SwiftUI

struct ConversionSection: View {
    var currency: Currency
    var textAlignment: TextAlignment
    
    @Binding var amount: String
    @Binding var showCurrencySelection: Bool
    
    @FocusState var isTyping: Bool
    
    var body: some View {
        VStack {
            // Currency
            HStack {
                // Currency image
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                
                // Currency text
                Text(currency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showCurrencySelection.toggle()
            }
            
            // TextField
            TextField("Amount", text: $amount)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(textAlignment)
                .focused($isTyping)
                .keyboardType(.decimalPad)
        }
    }
}

#Preview {
    ConversionSection(
        currency: .copperPenny,
        textAlignment: .trailing,
        amount: .constant("123"),
        showCurrencySelection: .constant(true)
    )
}
