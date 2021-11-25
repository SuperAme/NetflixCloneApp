//
//  MoviesModel.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import Foundation

struct MoviesModel: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case poster = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case overview = "overview"
        case tvShowTitle = "original_name"
        case firstAirDate = "first_air_date"
    }
    
    let poster: String?
    let title: String?
    let releaseDate: String?
    let overview: String?
    let tvShowTitle: String?
    let firstAirDate: String?
}

