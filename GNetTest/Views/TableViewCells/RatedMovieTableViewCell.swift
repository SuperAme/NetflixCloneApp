//
//  RatedMovieTableViewCell.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 25/11/21.
//

import UIKit

class RatedMovieTableViewCell: UITableViewCell {

    var ratedMoviesData = [[String]]()
    let favoriteMovies = MoviesManager()
    var myClousure: (([String]) -> Void)?
    
    static let identifier = Constants.ratedMovieTableViewCell
    
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
        favoriteMovies.parseRatedMoviesJson { (data) in
           for i in data.results {
               self.ratedMoviesData.append([i.title ?? Constants.noTitle, i.overview ?? Constants.noOverview, i.poster ?? Constants.noPoster, i.releaseDate ?? Constants.noDate])
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

extension RatedMovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = ratedMoviesData[indexPath.row][0]
        cell.dateLabel.text = ratedMoviesData[indexPath.row][3]
        if let url = URL(string: "\(Constants.imageURL)\(ratedMoviesData[indexPath.row][2])" ?? "") {
            
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    cell.movieImage.image = UIImage(data: data)
                }
            }
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ratedMoviesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myClousure?([ratedMoviesData[indexPath.row][0],ratedMoviesData[indexPath.row][1],ratedMoviesData[indexPath.row][2]])
    }

}

