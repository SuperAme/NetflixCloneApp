//
//  HeaderCollectionView.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import UIKit

class HeaderCollectionView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionView"
    
    lazy var headerLabel: UILabel = {
        let v = UILabel()
        v.text = "Header"
        v.font = v.font.withSize(20)
        v.textAlignment = .center
        return v
    }()
    
    public func configure() {
        backgroundColor = .systemBlue
        addSubview(headerLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = bounds
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
