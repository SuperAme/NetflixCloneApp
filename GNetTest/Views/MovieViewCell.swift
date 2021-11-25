//
//  MovieViewCell.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import UIKit

class MovieViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.backgroundColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(titleLabel)
        contentView.addSubview(myImage)
        contentView.addSubview(dateLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        myImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        myImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        myImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        myImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.2).isActive = true
        dateLabel.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 10).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//        dateLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 0.1).isActive = true
//        titleLabel.frame = CGRect(x: 5, y: 10, width: contentView.frame.size.width-10, height: 40)
        
//        myImage.frame = CGRect(x: 5, y: 60, width: contentView.frame.size.width-10, height: 200)
//        dateLabel.frame = CGRect(x: 5, y: 120, width: contentView.frame.size.width-10, height: 40)
        
//        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1).isActive = true
    }
}