//
//  ViewController.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import UIKit

class MainViewController: UIViewController {
    
    let favoriteMovies = MoviesManager()
    var favoriteMoviesData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        getMoviesData()
    }
    
    func getMoviesData() {
        favoriteMovies.parseFavoriteMoviesJson { (data) in
            for i in data.results {
                self.favoriteMoviesData.append(i.title ?? "No title")
            }
            print(self.favoriteMoviesData)
        }
    }


}

