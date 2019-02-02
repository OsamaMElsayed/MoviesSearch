//
//  MoviesListViewModel.swift
//  MoviesSearch
//
//  Created by osama on 11/19/18.
//  Copyright © 2018 osama. All rights reserved.
//

import Foundation

class MovieListViewModel{
    var movies:[MovieViewModel]!
    
    init(searchTerm:String, webService:WebService, completion: @escaping ()->Void){
        let query = "https://yts.am/api/v2/list_movies.json?query_term=\(searchTerm)&limit=50"
        if let url = URL(string:query){
           webService.searchMovies(url: url){
                movies in
            self.movies = movies.compactMap(MovieViewModel.init)
            
            DispatchQueue.main.async {
                completion()
            }
            }
        }
    }
    
    func title(atIndex index:Int) -> String{
        return "Title: \(movies[index].title)"
    }
    
    func titleForSearchResult(atIndex index:Int) -> String{
        return movies[index].title
    }
    
    func year(atIndex index:Int) -> String{
        return "Year: \(movies[index].year)"
    }
    func rating(atIndex index:Int) -> String{
        return "Rating:  \(movies[index].rating)"
    }
    
    func summary(atIndex index:Int) -> String{
        return "Summary:  \(movies[index].summary)"
    }
    
    var moviesCount:Int{
        get{
            return movies.count
        }
    }
    
    func imageUrl(atIndex index:Int) -> URL{
        return URL(string: movies[index].imageUrl)!
    }
}




    

