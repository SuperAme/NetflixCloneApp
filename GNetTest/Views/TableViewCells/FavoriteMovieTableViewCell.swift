//
//  FavoriteMovieTableViewCell.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 25/11/21.
//

import UIKit

class FavoriteMovieTableViewCell: UITableViewCell {
    
    let favoriteMovies = MoviesManager()
    var favoriteMoviesData = [[String]]()
    var myClousure: (([String]) -> Void)?
    
    static let identifier = Constants.favoriteMovieTableViewCell
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 300)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let nib = UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.1450980392, blue: 0.2549019608, alpha: 1)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        favoriteMovies.parseFavoriteMoviesJson { (data) in
           for i in data.results {
               self.favoriteMoviesData.append([i.title ?? Constants.noTitle, i.overview ?? Constants.noOverview, i.poster ?? Constants.noPoster, i.releaseDate ?? Constants.noDate])
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

extension FavoriteMovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = favoriteMoviesData[indexPath.row][0]
        cell.dateLabel.text = favoriteMoviesData[indexPath.row][3]
        if let url = URL(string: "\(Constants.imageURL)\(favoriteMoviesData[indexPath.row][2])" ?? "") {
            
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.movieImage.image = UIImage(data: data)
                }
            }
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteMoviesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myClousure?([favoriteMoviesData[indexPath.row][0],favoriteMoviesData[indexPath.row][1],favoriteMoviesData[indexPath.row][2]])
    }

}
