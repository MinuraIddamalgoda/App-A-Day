//
//  API_KEYS.swift
//  8 - MovieDB
//
//  Created by Minura Iddamalgoda on 26/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import Foundation

class API_KEYS: NSObject {

    let key: String! = "e29b7dac7821ca88dd8e80d702fd9f18"
    
    public func getApiKey() -> String {
        return self.key
    }
}
