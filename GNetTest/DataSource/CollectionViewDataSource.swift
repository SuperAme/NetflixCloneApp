//
//  CollectionViewDataSource.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import Foundation

class CollectionViewDataSource {
    var movies = [MovieData]()
    var sectionCategories = [String]()
    
    var recordCount: Int {
        return movies.count
    }
    
    var numberOfSections: Int {
        return sectionCategories.count
    }
    
    init() {
        movies = populateData()
        for movieCategory in MovieCategory.allCases {
            sectionCategories.append(movieCategory.rawValue)
        }
    }
    
    func numberOfItemsPerSection(_ index: Int) -> Int {
        let sectionName = MovieCategory(rawValue: sectionCategories[index])!
        return movies.filter( { (movie) -> Bool in
            return movie.category == sectionName
        }).count
    }
    
    func itemForSectionAtIndexPath(_ indexPath: IndexPath) -> MovieData{
        let sectionName = MovieCategory(rawValue: sectionCategories[indexPath.section])!
        return movies.filter ({ (movie) -> Bool in
            return movie.category == sectionName
        })[indexPath.item]
    }
    
    private func populateData() -> [MovieData] {
        let result = [
            MovieData(index: 0, name: "🐶", category: MovieCategory.favorites),
            MovieData(index: 1, name: "🦊", category: MovieCategory.favorites),
            MovieData(index: 2, name: "🐻", category: MovieCategory.favorites),
            MovieData(index: 3, name: "🐱", category: MovieCategory.favorites),
            MovieData(index: 4, name: "🪱", category: MovieCategory.favorites),
            MovieData(index: 0, name: "🐢", category: MovieCategory.rated),
            MovieData(index: 1, name: "🦂", category: MovieCategory.rated),
            MovieData(index: 2, name: "🪲", category: MovieCategory.rated),
            MovieData(index: 3, name: "🦄", category: MovieCategory.rated),
            MovieData(index: 4, name: "🐴", category: MovieCategory.rated),
            MovieData(index: 0, name: "🐌", category: MovieCategory.recommendated),
            MovieData(index: 1, name: "🐺", category: MovieCategory.recommendated),
            MovieData(index: 2, name: "🐮", category: MovieCategory.recommendated),
            MovieData(index: 3, name: "🐷", category: MovieCategory.recommendated),
            MovieData(index: 4, name: "🐼", category: MovieCategory.recommendated)
        ]
        return result
    }
}
