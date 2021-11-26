//
//  ViewController.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import UIKit

class MainViewController: UIViewController {
    
    let favoriteMovies = MoviesManager()
    
    let homeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(RecommendatedTableViewCell.self, forCellReuseIdentifier: RecommendatedTableViewCell.identifier)
        tableView.register(FavoriteMovieTableViewCell.self, forCellReuseIdentifier: FavoriteMovieTableViewCell.identifier)
        tableView.register(RatedMovieTableViewCell.self, forCellReuseIdentifier: RatedMovieTableViewCell.identifier)
        tableView.register(RecommendatedTvShowTableViewCell.self, forCellReuseIdentifier: RecommendatedTvShowTableViewCell.identifier)
        tableView.register(FavoriteTvShowTableViewCell.self, forCellReuseIdentifier: FavoriteTvShowTableViewCell.identifier)
        tableView.register(RatedTvShowTableViewCell.self, forCellReuseIdentifier: RatedTvShowTableViewCell.identifier)
        tableView.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.1450980392, blue: 0.2549019608, alpha: 1)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        title = "Gonet Test App"
        NSLayoutConstraint.activate([
            homeTableView.topAnchor.constraint(equalTo: view.topAnchor),
            homeTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendatedTableViewCell.identifier, for: indexPath) as? RecommendatedTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RatedMovieTableViewCell.identifier, for: indexPath) as? RatedMovieTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendatedTvShowTableViewCell.identifier, for: indexPath) as? RecommendatedTvShowTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTvShowTableViewCell.identifier, for: indexPath) as? FavoriteTvShowTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RatedTvShowTableViewCell.identifier, for: indexPath) as? RatedTvShowTableViewCell else {
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
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let sectionName: String
//        switch (section) {
//        case 0:
//            sectionName = "Favorite Movies"
//        case 1:
//            sectionName = "Recommendated Movies"
//        case 2:
//            sectionName = "Rated Movies"
//        case 3:
//            sectionName = "Recommendated TV Shows"
//        case 4:
//            sectionName = "Favorite TV Shows"
//        case 5:
//            sectionName = "Rated TV Shows"
//        default:
//            sectionName = "Unknow Category"
//        }
//        return sectionName
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.1450980392, blue: 0.2549019608, alpha: 1)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        switch (section) {
        case 0:
            label.text = "Favorite Movies"
        case 1:
            label.text = "Recommendated Movies"
        case 2:
            label.text = "Rated Movies"
        case 3:
            label.text = "Recommendated TV Shows"
        case 4:
            label.text = "Favorite TV Shows"
        case 5:
            label.text = "Rated TV Shows"
        default:
            label.text = "Unknow Category"
        }
        let headerView = UIView()
        headerView.backgroundColor = .gray
        return label
    }
}


