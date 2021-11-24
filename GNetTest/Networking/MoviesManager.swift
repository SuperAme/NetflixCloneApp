//
//  MoviesManager.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import Foundation

struct MoviesManager {
    
    func parseFavoriteMoviesJson(comp: @escaping (MoviesModel) -> ()) {
        if let url = URL(string: Constants.FavoriteMoviesUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("Error: \(String(describing: error?.localizedDescription))")
                }
                do {
                    let result = try JSONDecoder().decode(MoviesModel.self, from: data!)
                    comp(result)
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
}
