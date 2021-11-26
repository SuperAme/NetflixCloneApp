//
//  FavoriteMovieCollectionViewCell.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 25/11/21.
//

import UIKit

class FavoriteMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    static let identifier = "FavoriteMovieCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FavoriteMovieCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
