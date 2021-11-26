//
//  Constants.swift
//  GNetTest
//
//  Created by Americo Meneses Quintero on 24/11/21.
//

import Foundation

struct Constants {
    
    static let account = "account/"
    static let accountId = "10424085"
    static let apiKey = "?api_key=a9e48791899314569ffacc427ec23393"
    static let baseURL = "https://api.themoviedb.org/3/"
    static let favoriteMovies = "/favorite/movies"
    static let favoriteTvShow = "/favorite/tv"
    static let imageURL = "https://image.tmdb.org/t/p/w500"
    static let language = "&language=en-US"
    static let movieRecommendations = "movie/423108/recommendations"
    static let pageNumber = "&page=1"
    static let ratedMovies = "/rated/movies"
    static let ratedTvShow = "/rated/tv"
    static let sessionId = "&session_id=5d75ee0728b8fb712b17a586c2644c4a0219beff"
    static let sorted = "&sort_by=created_at.asc"
    static let tvShowRecommendations = "tv/78191/recommendations"
    static let favoriteMoviesUrl = baseURL + account + accountId + favoriteMovies + apiKey + sessionId
    static let recommendatedMoviesUrl = baseURL + movieRecommendations + apiKey + language + pageNumber
    static let ratedMoviesUrl = baseURL + account + accountId + ratedMovies + apiKey + language + sorted + pageNumber + sessionId
    static let favoriteTvShowsUrl = baseURL + account + accountId + favoriteTvShow + apiKey + language + sorted + pageNumber + sessionId
    static let ratedTvShowsUrl = baseURL + account + accountId + ratedTvShow + apiKey + language + sorted + pageNumber + sessionId
    static let recommendatedTvShowsUrl = baseURL + tvShowRecommendations + apiKey + language + pageNumber
    
}
