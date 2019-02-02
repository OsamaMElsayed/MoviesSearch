//
//  File.swift
//  MoviesSearch
//
//  Created by osama on 11/19/18.
//  Copyright © 2018 osama. All rights reserved.
//

import Foundation



class WebService{
    
    
    func searchMovies(url:URL, completion: @escaping ([Movie])->Void){
        URLSession.shared.dataTask(with: url){
            data, _, _ in
            
            if let data = data{
                if let json  = try! JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                    
                if let data = json["data"] as? [String:Any]{
                    let movieCount = data["movie_count"] as! Int
                    
                    if let movies = data["movies"] as? [Any]{
                    
                        var moviesList = [[String:Any]]()
                        let count = movieCount > 50 ? 50 : movieCount
                        for i in 0..<count{
                            if let movie = movies[i] as? [String: Any]
                            {
                                 moviesList.append(movie)
                            }
                        }
                        completion( moviesList.compactMap(Movie.init))
                    }
                    }
                    
                }
            }
            
        }.resume()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
