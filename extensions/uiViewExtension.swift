//
//  uiViewExtension.swift
//  vanhack
//
//  Created by Fernando Goulart on 22/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: self.frame.width, height: self.frame.height))
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    func asInviteImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: self.frame.width, height: 839))
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
