//
//  stringExtension.swift
//  vanhack
//
//  Created by Fernando Goulart on 22/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import Foundation

extension String {
    
    /// Esta propriedade deve retornar a quantidade de caracteres em nossa string
    var length: Int {
        return self.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[Range(start ..< end)])
    }
    
    
    var toArray : Array<String>{
        
        var arrayElementos : [String] = []
        
        for i in 0..<self.length{
            
            arrayElementos += [self[i]]
        }
        
        return arrayElementos
    }
    
    /// Retorna se o CPF gravado pela String é válido
    
    func isCPFValido() -> Bool {
        
        let tiraPontos = self.replacingOccurrences(of: ".", with: "")
        let cpfLimpo = tiraPontos.replacingOccurrences(of: "-", with: "")
        
        //let caracteres = Array(cpfLimpo.characters)
        
        //let num1 = (cpfLimpo.character(at: 1) as! Int)
        let num1 = Int(cpfLimpo[0])
        let num2 = Int(cpfLimpo[1])
        let num3 = Int(cpfLimpo[2])
        let num4 = Int(cpfLimpo[3])
        let num5 = Int(cpfLimpo[4])
        let num6 = Int(cpfLimpo[5])
        let num7 = Int(cpfLimpo[6])
        let num8 = Int(cpfLimpo[7])
        let num9 = Int(cpfLimpo[8])
        let num10 = Int(cpfLimpo[9])
        let num11 = Int(cpfLimpo[10])
        
        if num1 == num2 && num2 == num3 && num3 == num4 && num4 == num5 && num5 == num6 && num6 == num7 && num7 == num8 && num8 == num9 && num9 == num10 && num10 == num11 {
            return false
        }
        
        var soma1 = num1! * 10 + num2! * 9
        soma1 += num3! * 8 + num4! * 7
        soma1 += num5! * 6 + num6! * 5 + num7! * 4 + num8! * 3 + num9! * 2
        
        let resto1 = (soma1 * 10) % 11
        
        var soma2 = num1! * 11 + num2! * 10 + num3! * 9 + num4! * 8
        soma2 += num5! * 7 + num6! * 6 + num7! * 5 + num8! * 4 + num9! * 3 + num10! * 2
        
        
        var resto2 = (soma2 * 10) % 11
        
        if (resto2 == 10) {
            resto2 = 0
        }
        
        if (resto1 == num10) && (resto2 == num11) {
            return true
        }
        
        return false
    }
    
    /// Retorna se a data no formato dd/MM/yyyy em String é válida
    func isDataValida() -> Bool {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        if  dateFormatter.date(from: self) != nil {
            
            return true
        }else {
            return false
        }
        
        
        
    }
    
    func isPrice() -> Bool {
        //^[1-9][0-9]*(([,.][0-9])?[0-9]?)?$
        
        let pricePattern : String = "^[1-9][0-9]*(([,.][0-9])?[0-9]?)?$"
        
        let regex = try! NSRegularExpression(pattern: pricePattern ,
                                             options: [.caseInsensitive])
        
        return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, (self as NSString).length)) != nil
    }
    
    /// Retorna se a email é válido
    func isEmail( ) -> Bool {
        ///[^\s@]+@[^\s@]+\.[^\s@]+/i
        
        let emailPattern : String = "[^\\s@]+@[^\\s@]+\\.[^\\s@]+"
        
        let regex = try! NSRegularExpression(pattern: emailPattern ,
                                             options: [.caseInsensitive])
        
        return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, (self as NSString).length)) != nil
        
    }
    
    func isNilOrBrazilianMobile() -> Bool {
        
        if self  == "" {
            return true
        } else {
            
            let onlyNumbers = String(self.filter { "01234567890.".contains($0) })
            let regex = try! NSRegularExpression(pattern: "^([0-9]){13}$",
                                                 options: [.caseInsensitive])
            
            return regex.firstMatch(in: onlyNumbers, options: [], range: NSMakeRange(0, (onlyNumbers as NSString).length)) != nil
        }
    }
    
    /// Retorna se é numérico. Útil principalmente para validar textFields
    func isNumeric() -> Bool {
        
        let regex = try! NSRegularExpression(pattern: "^([0-9])+$",
                                             options: [.caseInsensitive])
        
        return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, (self as NSString).length)) != nil
        
    }
    
    /**
     
     Este método retorna uma string dada o receiver sem os characteres em branco e novas linhas.
     */
    func trim() -> String
    {
        
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    
    /// Transforma a data dd/MM/yyyy para yyyy-mm-dd
    func transformaData () -> String {
        let ano = self[Range(6...9)]
        let mes = self[Range(3...4)]
        let dia = self[Range(0...1)]
        
        return ("\(ano)-\(mes)-\(dia)")
    }
    
    
    /// Substitui uma string por outra
    func substitui (de: String, para: String) -> String {
        let texto = self as NSString
        return texto.replacingOccurrences(of: de, with: para) as String
    }
    
    /// Retorna data YYYY-MM-DDTHH:MM:SS.000Z em Data
    func retornaEmData () -> Date? {
        let dateFormatter = DateFormatter()
        
        //        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:sszzz"
        //        let dateToReturn = dateFormatter.date(from: self[Range(0...18)] + "BRT")
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.init(abbreviation: "BRT")
        
        let dateToReturn = dateFormatter.date(from: self[Range(0...18)])
        
        return dateToReturn
    }
    
    func retornaIniciais() -> String {
        let stringArray = self.components(separatedBy: " ")
        if stringArray.count > 1 {
            //tem nome e sobrenome
            
            let primeiraLetra = stringArray.first?.substring(to: 1).uppercased()
            let ultimaLetra = stringArray.last?.substring(to: 1).uppercased()
            return primeiraLetra! + ultimaLetra!
        } else {
            return (stringArray.first?.substring(to: 1).uppercased())!
        }
        
        //componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
    }
    
    struct NumFormatter {
        static let instance = NumberFormatter()
    }
    
    var doubleValue: Double? {
        NumFormatter.instance.locale = NSLocale.current // This is the default
        NumFormatter.instance.decimalSeparator = NSLocale.current.decimalSeparator
        NumFormatter.instance.numberStyle = .decimal
        NumFormatter.instance.alwaysShowsDecimalSeparator = true
        return NumFormatter.instance.number(from: self)?.doubleValue
    }
    
    var integerValue: Int? {
        NumFormatter.instance.locale = NSLocale.current // This is the default
        NumFormatter.instance.decimalSeparator = NSLocale.current.decimalSeparator
        return NumFormatter.instance.number(from: self)?.intValue
    }
    
    func retornaBandeiraCartao() -> String {
        
        let jcbRegEx = "^(?:2131|1800|35)[0-9]{0,}$"
        let amexRegEx = "^3[47][0-9]{0,}$"
        let dinersRegEx = "^3(?:0[0-59]{1}|[689])[0-9]{0,}$"
        let visaRegEx = "^4[0-9]{0,}$"
        let mastercardRegEx = "^(5[1-5]|222[1-9]|22[3-9]|2[3-6]|27[01]|2720)[0-9]{0,}$"
        let discoverRegEx = "^(6011|65|64[4-9]|62212[6-9]|6221[3-9]|622[2-8]|6229[01]|62292[0-5])[0-9]{0,}$"
        
        let masterTest = NSPredicate(format: "SELF MATCHES %@", mastercardRegEx)
        let visaTest = NSPredicate(format: "SELF MATCHES %@", visaRegEx)
        let amexTest = NSPredicate(format: "SELF MATCHES %@", amexRegEx )
        let jcbTest = NSPredicate(format: "SELF MATCHES %@", jcbRegEx )
        let dinersTest = NSPredicate(format: "SELF MATCHES %@", dinersRegEx )
        let discoverTest = NSPredicate(format: "SELF MATHCES %@", discoverRegEx)
        
        
        if masterTest.evaluate(with: self) {
            return "master"
        }
        if visaTest.evaluate(with: self) {
            return "visa"
        }
        if amexTest.evaluate(with: self) {
            return "amex"
        }
        if jcbTest.evaluate(with: self) {
            return "jcb"
        }
        if dinersTest.evaluate(with: self) {
            return "diners"
        }
        if discoverTest.evaluate(with: self) {
            return "discover"
        }
        
        
        return ""
        
    }
    
    func limpaCPF() -> String {
        
        //let unfiltered = self
        
        // Array of Characters to remove
        let removal: [Character] = [".","-"]
        
        // turn the string into an Array
        let unfilteredCharacters = self
        
        // return an Array without the removal Characters
        let filteredCharacters = unfilteredCharacters.filter { !removal.contains($0) }
        
        // build a String with the filtered Array
        let filtered = String(filteredCharacters)
        
        print(filtered) // => "yeah"
        
        // combined to a single line
        //print(String(unfiltered.characters.filter { !removal.contains($0) })) // => "yuahl"
        
        return filtered
        
    }
}

