//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Juan Camilo Victoria Pacheco on 19/04/24.
//

import SwiftUI

struct ExchangeInfo: View {
  @Environment(\.dismiss) var dismiss
  private let leftImages: [ImageResource] = [.goldpiece, .goldpenny, .silverpiece, .silverpenny, .copperPiece]
  private let rightImages: [ImageResource] = [.goldpenny, .silverpiece, .silverpenny, .copperPiece, .copperpenny]
  private let texts: [String] = ["ExchangeInfo.GoldToGoldPenny", "ExchangeInfo.GoldPennyToSilver", "ExchangeInfo.SilverToSilverPenny", "ExchangeInfo.SilverPennyToCopper", "ExchangeInfo.CopperToCopperPenny"]
  
  var body: some View {
    ZStack {
      // Background parchment image
      Image(.parchment)
        .resizable()
        .ignoresSafeArea()
        .background(.brown)
      
      VStack {
        // Title text
        Text("ExchangeInfo.title")
          .font(.largeTitle)
          .tracking(3)
        
        // Description text
        Text("ExchangeInfo.label")
          .font(.title2)
          .padding()
        
        // Exchange rates
        ForEach(texts.indices, id: \.self) { index in
          ExchangeRate(
            leftImage: leftImages[index],
            text: texts[index],
            rightImage: rightImages[index])
        }
        
        // Done button
        Button("ExchangeInfo.buttonLabel"){
          dismiss()
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
