//
//  RecommendatedTableViewCell.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 25/11/21.
//

import UIKit

class RecommendatedTableViewCell: UITableViewCell {
    
    let favoriteMovies = MoviesManager()
    var recommendatedMoviesData = [[String]]()
    
    static let identifier = "RecommendatedTableViewCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 300)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let nib = UINib(nibName: RecommendatedMovieCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: RecommendatedMovieCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        favoriteMovies.parseRecommendatedMoviesJson { (data) in
            for i in data.results {
                self.recommendatedMoviesData.append([i.title ?? "No title", i.overview ?? "No overview", i.poster ?? "No poster", i.releaseDate ?? "No release Date"])
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
}

extension RecommendatedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendatedMovieCollectionViewCell.identifier, for: indexPath) as? RecommendatedMovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = recommendatedMoviesData[indexPath.row][1]
        cell.dateLabel.text = recommendatedMoviesData[indexPath.row][3]
        if let url = URL(string: "\(Constants.imageURL)\(recommendatedMoviesData[indexPath.row][2])" ?? "") {
            
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.movieImage.image = UIImage(data: data)
                }
            }
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendatedMoviesData.count
    }
}
