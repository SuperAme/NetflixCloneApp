//
//  MoviesManager.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import Foundation

struct MoviesManager {
    
    func parseFavoriteMoviesJson(comp: @escaping (MoviesModel) -> ()) {
        if let url = URL(string: Constants.favoriteMoviesUrl) {
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
    
    func parseRecommendatedMoviesJson(comp: @escaping (MoviesModel) -> ()) {
        if let url = URL(string: Constants.recommendatedMoviesUrl) {
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
    
    func parseRatedMoviesJson(comp: @escaping (MoviesModel) -> ()) {
        if let url = URL(string: Constants.ratedMoviesUrl) {
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
    
    func parseFavoriteTvShowsJson(comp: @escaping (MoviesModel) -> ()) {
        if let url = URL(string: Constants.favoriteTvShowsUrl) {
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
    
    func parseRatedTvShowsJson(comp: @escaping (MoviesModel) -> ()) {
        if let url = URL(string: Constants.ratedTvShowsUrl) {
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
    
    func parseRecommendatedTvShowsJson(comp: @escaping (MoviesModel) -> ()) {
        if let url = URL(string: Constants.recommendatedTvShowsUrl) {
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
