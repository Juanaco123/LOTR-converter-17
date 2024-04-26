//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Juan Camilo Victoria Pacheco on 19/04/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency
    @State var rightCurrency: Currency
    
    init() {
        let savedLeftCurrency = UserDefaults.standard.value(forKey: "TopCurrency") as? Double ?? Currency.silverPiece.rawValue
        let savedRightCurrency = UserDefaults.standard.value(forKey: "BottomCurrency") as? Double ?? Currency.goldPiece.rawValue
        
        leftCurrency = Currency(rawValue: savedLeftCurrency)!
        rightCurrency = Currency(rawValue: savedRightCurrency)!
    }
    
    var body: some View {
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Currency conversion section
                HStack {
                    // Left conversion section
                    ConversionSection(
                        currency: leftCurrency,
                        textAlignment: .leading,
                        amount: $leftAmount,
                        showCurrencySelection: $showSelectCurrency,
                        isTyping: _leftTyping
                    )
                    .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack {
                        ConversionSection(
                            currency: rightCurrency,
                            textAlignment: .trailing,
                            amount: $rightAmount,
                            showCurrencySelection: $showSelectCurrency,
                            isTyping: _rightTyping
                        )
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                // Info Button
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
            
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

#Preview {
    ContentView()
}
