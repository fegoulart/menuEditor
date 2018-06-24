//
//  intExtension.swift
//  vanhack
//
//  Created by Fernando Goulart on 22/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    
    func uiColorFromHex() -> UIColor {
        
        // &  binary AND operator to zero out other color values
        // >>  bitwise right shift operator
        // Divide by 0xFF because UIColor takes CGFloats between 0.0 and 1.0
        
        let red =   CGFloat((self & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((self & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(self & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
}
