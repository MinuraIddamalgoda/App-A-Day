//
//  FormatRemainingStock.swift
//  12 - Runners
//
//  Created by Minura Iddamalgoda on 13/2/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import Foundation

class FormatRemainingStock {
    static func getStockPhrase(stock: Int) -> String {
        switch stock {
        case 0:
            return "None Remaining"
        case 1:
            return "Last One Left"
        default:
            return String(stock)
        }
    }
}
