//
//  Movie.swift
//  MoviesSearch
//
//  Created by osama on 1/28/19.
//  Copyright © 2019 osama. All rights reserved.
//

import Foundation
class Movie{
    var title:String!
    var rating:Double!
    var year: Int!
    var summary:String!
    var imageUrl:String!
    
    init?(dictionary: [String:Any]){
        guard let title = dictionary["title"] as? String,
            let rating = dictionary["rating"] as? Double,
            let year = dictionary["year"] as? Int,
            let imageUrl = dictionary["small_cover_image"] as? String,
            let summary = dictionary["summary"] as? String else {
                return
        }
        self.title = title
        self.imageUrl = imageUrl
        self.rating = rating
        self.year = year
        self.summary = summary
    }
}
