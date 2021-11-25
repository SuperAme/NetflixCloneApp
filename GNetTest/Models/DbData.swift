//
//  DbData.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import Foundation

enum MovieCategory: String, CaseIterable {
    case favorites = "Favorites"
    case rated = "Rated"
    case recommendated = "Recommendated"
}

struct MovieData {
    let index: Int
    let name: String
    let category: MovieCategory
}
