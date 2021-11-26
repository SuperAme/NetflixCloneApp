//
//  ViewController.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import UIKit

class MainViewController: UIViewController {
    
    var favoriteMoviesData = [[String]]()
    var recommendatedMoviesData = [[String]]()
    var ratedMoviesData = [[String]]()
    var favoriteTvShowsData = [[String]]()
    var recommendatedTvShowsData = [[String]]()
    var ratedTvShowsData = [[String]]()
    
    let favoriteMovies = MoviesManager()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let homeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(RecommendatedTableViewCell.self, forCellReuseIdentifier: RecommendatedTableViewCell.identifier)
        tableView.register(FavoriteMovieTableViewCell.self, forCellReuseIdentifier: FavoriteMovieTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        homeTableView.delegate = self
        homeTableView.dataSource = self
        setup()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }
    
    func setup() {
        view.addSubview(homeTableView)
        
        NSLayoutConstraint.activate([
            homeTableView.topAnchor.constraint(equalTo: view.topAnchor),
            homeTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getMoviesData() {
        
         favoriteMovies.parseFavoriteMoviesJson { (data) in
            for i in data.results {
                self.favoriteMoviesData.append([i.title ?? "No title", i.overview ?? "No title", i.poster ?? "No poster", i.releaseDate ?? "No release Date"])
            }
             
        }
        
        
//        favoriteMovies.parseRecommendatedMoviesJson { (data) in
//            for i in data.results {
//                recommendatedMoviesData.append([i.title ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.releaseDate ?? "No release Date"])
//            }
//            print(self.recommendatedMoviesData)
//        }
//
//        favoriteMovies.parseRatedMoviesJson { (data) in
//            for i in data.results {
//                ratedMoviesData.append([i.title ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.releaseDate ?? "No release Date"])
//            }
//            print(self.ratedMoviesData)
//        }
//
//        favoriteMovies.parseFavoriteTvShowsJson { (data) in
//            for i in data.results {
//                favoriteTvShowsData.append([i.tvShowTitle ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.firstAirDate ?? "No release Date"])
//            }
//            print(self.favoriteTvShowsData)
//        }
//
//        favoriteMovies.parseRatedTvShowsJson { (data) in
//            for i in data.results {
//                ratedTvShowsData.append([i.tvShowTitle ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.firstAirDate ?? "No release Date"])
//            }
//            print(self.ratedTvShowsData)
//        }
//
//        favoriteMovies.parseRecommendatedTvShowsJson { (data) in
//            for i in data.results {
//                recommendatedTvShowsData.append([i.tvShowTitle ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.firstAirDate ?? "No release Date"])
//            }
//            print(self.recommendatedTvShowsData)
//        }
        
        
    }
    


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteMovieTableViewCell.identifier, for: indexPath) as? FavoriteMovieTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendatedTableViewCell.identifier, for: indexPath) as? RecommendatedTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch (section) {
        case 0:
            sectionName = "Favorite Movies"
        case 1:
            sectionName = "Recommendates Movies"
        case 2:
            sectionName = "Rated Movies"
        case 3:
            sectionName = "Favorite TV Shows"
        case 4:
            sectionName = "Recommendates TV Shows"
        case 5:
            sectionName = "Rated TV Shows"
        default:
            sectionName = "Unknow Category"
        }
        return sectionName
    }
}


