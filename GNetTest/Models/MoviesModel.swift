//
//  MoviesModel.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import Foundation

struct MoviesModel: Codable {
    let results: [Results]
}

struct Results: Codable {
    let poster_path: String?
    let title: String?
    let release_date: String?
    let overview: String?
    let vote_average: Float?
}
