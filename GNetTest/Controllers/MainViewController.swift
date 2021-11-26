//
//  ViewController.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import UIKit

protocol MainViewDidSelectActionDelegate: class {
    func selectionAction(data: [String], indexPath: IndexPath)
}

class MainViewController: UIViewController {
    
    weak var mainViewDidSelectActionDelegate: MainViewDidSelectActionDelegate?
    
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
        
        title = "Gonet Test App"
        
        if NetworkMonitor.shared.isConnected {
            let favoriteMovies = MoviesManager()
            view.addSubview(homeTableView)
            NSLayoutConstraint.activate([
                homeTableView.topAnchor.constraint(equalTo: view.topAnchor),
                homeTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                homeTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        } else {
            
            let alert = UIAlertController(title: "Sorry", message: "No internet", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    exit(-1)
                }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)        }
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource, MainViewDidSelectActionDelegate {
    func selectionAction(data: [String], indexPath: IndexPath) {
        mainViewDidSelectActionDelegate?.selectionAction(data: data, indexPath: indexPath)
    }
    
    
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
            cell.myClousure = { [weak self] (value) in
                let vc = DetailMovieViewController()
                if let url = URL(string: "\(Constants.imageURL)\(value[2])") {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            vc.movieImageView.image = UIImage(data: data)
                        }
                    }
                }
                
                vc.nameLabel.text = value[0]
                vc.descriptionLabel.text = value[1]
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendatedTableViewCell.identifier, for: indexPath) as? RecommendatedTableViewCell else {
                return UITableViewCell()
            }
            cell.myClousure = { [weak self] (value) in
                let vc = DetailMovieViewController()
                if let url = URL(string: "\(Constants.imageURL)\(value[2])") {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            vc.movieImageView.image = UIImage(data: data)
                        }
                    }
                }
                
                vc.nameLabel.text = value[0]
                vc.descriptionLabel.text = value[1]
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RatedMovieTableViewCell.identifier, for: indexPath) as? RatedMovieTableViewCell else {
                return UITableViewCell()
            }
            cell.myClousure = { [weak self] (value) in
                let vc = DetailMovieViewController()
                if let url = URL(string: "\(Constants.imageURL)\(value[2])") {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            vc.movieImageView.image = UIImage(data: data)
                        }
                    }
                }
                
                vc.nameLabel.text = value[0]
                vc.descriptionLabel.text = value[1]
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendatedTvShowTableViewCell.identifier, for: indexPath) as? RecommendatedTvShowTableViewCell else {
                return UITableViewCell()
            }
            cell.myClousure = { [weak self] (value) in
                let vc = DetailMovieViewController()
                if let url = URL(string: "\(Constants.imageURL)\(value[2])") {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            vc.movieImageView.image = UIImage(data: data)
                        }
                    }
                }
                
                vc.nameLabel.text = value[0]
                vc.descriptionLabel.text = value[1]
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTvShowTableViewCell.identifier, for: indexPath) as? FavoriteTvShowTableViewCell else {
                return UITableViewCell()
            }
            cell.myClousure = { [weak self] (value) in
                let vc = DetailMovieViewController()
                if let url = URL(string: "\(Constants.imageURL)\(value[2])") {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            vc.movieImageView.image = UIImage(data: data)
                        }
                    }
                }
                
                vc.nameLabel.text = value[0]
                vc.descriptionLabel.text = value[1]
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RatedTvShowTableViewCell.identifier, for: indexPath) as? RatedTvShowTableViewCell else {
                return UITableViewCell()
            }
            cell.myClousure = { [weak self] (value) in
                let vc = DetailMovieViewController()
                if let url = URL(string: "\(Constants.imageURL)\(value[2])") {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            vc.movieImageView.image = UIImage(data: data)
                        }
                    }
                }
                
                vc.nameLabel.text = value[0]
                vc.descriptionLabel.text = value[1]
                self?.navigationController?.pushViewController(vc, animated: true)
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


