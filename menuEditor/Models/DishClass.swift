//
//  DishClass.swift
//  menuEditor
//
//  Created by Fernando Goulart on 24/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import Foundation
import UIKit

class Dish {
    
    var dishId : Int
    var dishName : String
    var dishPrice : Double
    var dishDescription : String
    var dishImage : UIImage
    
    init (dishId: Int, dishName: String, dishDescription: String, dishPrice: Double, dishImage: UIImage) {
        self.dishId = dishId
        self.dishName = dishName
        self.dishPrice = dishPrice
        self.dishDescription = dishDescription
        self.dishImage = dishImage
    }
    
}
