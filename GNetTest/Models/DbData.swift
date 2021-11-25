//
//  DbData.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import Foundation

struct Movie {
    let name: String
    let date: String
    let image: String
    
    init(name: String, date: String, image: String) {
        self.name = name
        self.date = date
        self.image = image
    }
}
