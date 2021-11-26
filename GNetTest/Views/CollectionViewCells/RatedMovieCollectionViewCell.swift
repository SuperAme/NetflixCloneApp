//
//  RatedMovieCollectionViewCell.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 25/11/21.
//

import UIKit

class RatedMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    static let identifier = "RatedMovieCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "RatedMovieCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
