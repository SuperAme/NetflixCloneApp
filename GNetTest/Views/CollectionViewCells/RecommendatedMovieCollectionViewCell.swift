//
//  MovieCollectionViewCell.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 25/11/21.
//

import UIKit

class RecommendatedMovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    static let identifier = "RecommendatedMovieCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "RecommendatedMovieCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
