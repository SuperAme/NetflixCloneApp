//
//  MovieCollectionViewCell.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 25/11/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    static let identifier = Constants.movieCollectionViewCellIdentifier
    
    static func nib() -> UINib {
        return UINib(nibName: Constants.movieCollectionViewCellIdentifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
