//
//  doubleExtension.swift
//  vanhack
//
//  Created by Fernando Goulart on 22/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import Foundation

extension Double {
    
    func retornaValorFinanceiro() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        // formatter.locale = NSLocale.currentLocale() // This is the default
        let retorno = formatter.string(from: NSNumber(value: self))
        return retorno!
    }
    
    func retornaValor() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.alwaysShowsDecimalSeparator = true
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.locale = NSLocale.current // This is the default
        formatter.decimalSeparator = NSLocale.current.decimalSeparator
        let retorno = formatter.string(from: NSNumber(value: self))
        
        return retorno!
    }
    
}
