//
//  MovieViewModel.swift
//  MoviesSearch
//
//  Created by osama on 1/28/19.
//  Copyright © 2019 osama. All rights reserved.
//

import Foundation

class MovieViewModel{
    
    
    var title:String
    var rating:Double
    var year: Int
    var summary:String
    var imageUrl :String
    
    init (movie: Movie){
        self.title = movie.title
        self.rating = movie.rating
        self.year  = movie.year
        self.summary = movie.summary
        self.imageUrl = movie.imageUrl
}
}
