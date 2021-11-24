//
//  ViewController.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import UIKit

class MainViewController: UIViewController {
    
    let favoriteMovies = MoviesManager()
    
    var favoriteMoviesData = [[String]]()
    var recommendatedMoviesData = [[String]]()
    var ratedMoviesData = [[String]]()
    var favoriteTvShowsData = [[String]]()
    var recommendatedTvShowsData = [[String]]()
    var ratedTvShowsData = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        getMoviesData()
//        print(Constants.favoriteTvShowsUrl)
    }
    
    func getMoviesData() {
        favoriteMovies.parseFavoriteMoviesJson { (data) in
            for i in data.results {
                self.favoriteMoviesData.append([i.title ?? "No title", i.overview ?? "No title", i.poster ?? "No poster", i.releaseDate ?? "No release Date"])
            }
//            print(self.favoriteMoviesData)
        }
        
        favoriteMovies.parseRecommendatedMoviesJson { (data) in
            for i in data.results {
                self.recommendatedMoviesData.append([i.title ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.releaseDate ?? "No release Date"])
            }
//            print(self.recommendatedMoviesData)
        }
        
        favoriteMovies.parseRatedMoviesJson { (data) in
            for i in data.results {
                self.ratedMoviesData.append([i.title ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.releaseDate ?? "No release Date"])
            }
//            print(self.ratedMoviesData)
        }
        
        favoriteMovies.parseFavoriteTvShowsJson { (data) in
            for i in data.results {
                self.favoriteTvShowsData.append([i.tvShowTitle ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.firstAirDate ?? "No release Date"])
            }
//            print(self.favoriteTvShowsData)
        }
        
        favoriteMovies.parseRatedTvShowsJson { (data) in
            for i in data.results {
                self.ratedTvShowsData.append([i.tvShowTitle ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.firstAirDate ?? "No release Date"])
            }
//            print(self.ratedTvShowsData)
        }
        
        favoriteMovies.parseRecommendatedTvShowsJson { (data) in
            for i in data.results {
                self.recommendatedTvShowsData.append([i.tvShowTitle ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.firstAirDate ?? "No release Date"])
            }
            print(self.recommendatedTvShowsData)
        }
        
        
    }


}

