//
//  Car.swift
//  2 - Sales of Cars
//
//  Created by Minura Iddamalgoda on 12/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import Foundation
import UIKit

class Car {
    var name: String = ""
    var year: Int = -1
    var price: Float = -1
    var image: UIImage
    
    init(name: String, year: Int, price: Float, image: UIImage) {
        self.name = name
        self.year = year
        self.price = price
        self.image = image
    }
}

