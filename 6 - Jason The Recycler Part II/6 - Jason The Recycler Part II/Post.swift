//
//  Post.swift
//  6 - Jason The Recycler Part II
//
//  Created by Minura Iddamalgoda on 23/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import Foundation

class Post: NSObject {
    
    var userId: String = ""
    var id: String  = ""
    var title: String  = ""
    var body: String  = ""
    
    
    init(userId: String, id: String, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
