//
//  Food.swift
//  12 - Runners
//
//  Created by Minura Iddamalgoda on 13/2/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import Foundation
import UIKit

class Food : NSObject {
    var name: String = ""
    var type: FoodType
    var price: Float = 0.0
    var stockRemaining: Int = 0
    var image: UIImage
    
    init(_ name: String, _ type: FoodType, _ price: Float, _ stockRemaining: Int, _ image: UIImage) {
        self.name = name
        self.type = type
        self.price = price
        self.stockRemaining = stockRemaining
        self.image = image
    }
    
    enum FoodType {
        case Steak, Chicken
    }
}
