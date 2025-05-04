//
//  CurrencyTip.swift
//  LOTRConverter17
//
//  Created by Juan Camilo Victoria Pacheco on 24/04/24.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text(LocalizedStringKey("CurrencyTip.Title"))
    
    var message: Text? = Text(LocalizedStringKey("CurrencyTip.Message"))
    
}
