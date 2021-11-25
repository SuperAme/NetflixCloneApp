//
//  MovieCollectionCell.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    var emojiData: MovieData? {
        didSet {
            if let emojiData = emojiData {
                name.text = emojiData.name
            }
        }
    }
    
    lazy var name: UILabel = {
        let v = UILabel()
        v.text = "🐻"
        v.font = v.font.withSize(75)
        v.textAlignment = .center
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        contentView.addSubview(name)
        contentView.clipsToBounds = true
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: leadingAnchor),
            name.trailingAnchor.constraint(equalTo: trailingAnchor),
            name.topAnchor.constraint(equalTo: topAnchor),
            name.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func stylizeView() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2
    }
}
