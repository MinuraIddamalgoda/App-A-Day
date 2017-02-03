//
//  SearchResult.swift
//  8 - MovieDB
//
//  Created by Minura Iddamalgoda on 2/2/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import Foundation
import UIKit

class SearchResult: NSObject {
    
    var title: String = ""
    var poster: UIImage?
    var overview: String = ""
    var voteCount: Int = -1
    var voteAverage: Float = -1
    
    init(_ title: String,_ poster: UIImage,_ overview: String,_ voteCount: Int,_ voteAverage: Float) {
        self.title = title
        self.poster = poster
        self.overview = overview
        self.voteCount = voteCount
        self.voteAverage = voteAverage
    }
    
}
