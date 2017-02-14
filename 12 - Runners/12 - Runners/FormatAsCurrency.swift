//
//  FormatAsCurrency.swift
//  12 - Runners
//
//  Created by Minura Iddamalgoda on 13/2/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import Foundation

class FormatAsCurrency {
    static func getFormart(_ value: Float) -> String {
        let nsValue = value as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: nsValue)!
    }
}
