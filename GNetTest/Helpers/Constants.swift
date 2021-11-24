//
//  Constants.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import Foundation

struct Constants {
    //Favorite Movie
    //https://api.themoviedb.org/3/account/10424085/favorite/movies?api_key=a9e48791899314569ffacc427ec23393&session_id=5d75ee0728b8fb712b17a586c2644c4a0219beff
    
    //Rated Movie
    //https://api.themoviedb.org/3/account/10424085/rated/movies?api_key=a9e48791899314569ffacc427ec23393&language=en-US&sort_by=created_at.asc&page=1&session_id=5d75ee0728b8fb712b17a586c2644c4a0219beff
    //recommendated MOvie
    //https://api.themoviedb.org/3/movie/423108/recommendations?api_key=a9e48791899314569ffacc427ec23393&language=en-US&page=1
    //Favorite TV Show
    //https://api.themoviedb.org/3/account/10424085/favorite/tv?api_key=a9e48791899314569ffacc427ec23393&language=en-US&sort_by=created_at.asc&page=1&session_id=5d75ee0728b8fb712b17a586c2644c4a0219beff
    //Rated TV SHow
    //https://api.themoviedb.org/3/account/10424085/rated/tv?api_key=a9e48791899314569ffacc427ec23393&language=en-US&sort_by=created_at.asc&page=1&session_id=5d75ee0728b8fb712b17a586c2644c4a0219beff
    //Recommendated tv show
    //https://api.themoviedb.org/3/tv/78191/recommendations?api_key=a9e48791899314569ffacc427ec23393&language=en-US&page=1
    
    static let account = "account/"
    static let accountId = "10424085"
    static let apiKey = "?api_key=a9e48791899314569ffacc427ec23393"
    static let baseURL = "https://api.themoviedb.org/3/"
    static let favoriteMovies = "/favorite/movies"
    static let favoriteTvShow = "/favorite/tv"
    static let imageURL = "https://image.tmdb.org/t/p/w500"
    static let language = "en-US"
    static let movieRecommendations = "movie/423108/recommendations"
    static let pageNumber = "&page=1"
    static let ratedMovies = "/rated/movies"
    static let ratedTvShow = "/rated/tv"
    static let sessionId = "&session_id=5d75ee0728b8fb712b17a586c2644c4a0219beff"
    static let sorted = "&sort_by=created_at.asc"
    static let tvShowRecommendations = "tv/78191/recommendations"
    static let FavoriteMoviesUrl = baseURL + account + accountId + favoriteMovies + apiKey + sessionId
    
}
