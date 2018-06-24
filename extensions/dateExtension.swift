//
//  dateExtension.swift
//  vanhack
//
//  Created by Fernando Goulart on 22/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import Foundation

extension Date {
    
    func retornaDiaDaSemana() -> String {
        let dateFormatter = DateFormatter()
        
        let langStr = Locale.current.languageCode
        dateFormatter.locale = Locale(identifier: langStr!)
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
        //TODO - Verificar se deve mesmo setar o timezone para BRT
        dateFormatter.timeZone = TimeZone.init(abbreviation: "BRT")
        let retorno = dateFormatter.string(from: self)
        return retorno
    }
    
    func retornaDiaMesAno() -> String {
        let dateFormatter = DateFormatter()
        
        let langStr = Locale.current.languageCode
        dateFormatter.locale = Locale(identifier: langStr!)
        //TODO - Verificar se deve mesmo setar o timezone para BRT
        dateFormatter.timeZone = TimeZone.init(abbreviation: "BRT")
        dateFormatter.dateFormat = "dd/MMM/yy"
        let retorno = dateFormatter.string(from: self)
        return retorno
    }
    
    func retornaDiaMesAno2() -> String {
        let dateFormatter = DateFormatter()
        
        let langStr = Locale.current.languageCode
        dateFormatter.locale = Locale(identifier: langStr!)
        //TODO - Verificar se deve mesmo setar o timezone para BRT
        dateFormatter.timeZone = TimeZone.init(abbreviation: "BRT")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let retorno = dateFormatter.string(from: self)
        return retorno
    }
    
    
    
    func retornaHora() -> String {
        let dateFormatter = DateFormatter()
        
        let langStr = Locale.current.languageCode
        dateFormatter.locale = Locale(identifier: langStr!)
        //TODO - Verificar se deve mesmo setar o timezone para BRT
        dateFormatter.timeZone = TimeZone.init(abbreviation: "BRT")
        dateFormatter.dateFormat = "HH:mm"
        let retorno = dateFormatter.string(from: self)
        return retorno
    }
    
    
}
