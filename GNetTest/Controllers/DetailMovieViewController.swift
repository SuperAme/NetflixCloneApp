//
//  DetailMovieViewController.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 26/11/21.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dummy text"
        label.textAlignment = .center
        return label
    }()
    
    let movieImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.contentMode = .scaleAspectFit
        return theImageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dummy text"
        label.font = label.font.withSize(14)
        label.numberOfLines = 20
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
    }
    
    func setup() {
        
        view.addSubview(nameLabel)
        view.addSubview(movieImageView)
        view.addSubview(descriptionLabel)
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        movieImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        movieImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
}

extension UIImageView {
    func loadImge(withUrl url: URL) {
           DispatchQueue.global().async { [weak self] in
               if let imageData = try? Data(contentsOf: url) {
                   if let image = UIImage(data: imageData) {
                       DispatchQueue.main.async {
                           self?.image = image
                       }
                   }
               }
           }
       }
}
