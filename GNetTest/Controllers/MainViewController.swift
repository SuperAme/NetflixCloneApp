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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HeaderCollectionView.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionView.identifier)
        return collectionView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
        collectionView.backgroundColor = .white
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
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
//            print(self.recommendatedTvShowsData)
        }
        
        
    }


}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.5, height: collectionView.frame.width+35)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieViewCell
        cell.titleLabel.text = "Mi titulo"
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionView.identifier, for: indexPath) as! HeaderCollectionView
//        header.configure()
//        return header
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 50)
//    }
    
}

