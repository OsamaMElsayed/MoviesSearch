//
//  ViewController.swift
//  MoviesSearch
//
//  Created by osama on 11/19/18.
//  Copyright © 2018 osama. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBAction func onSearch(_ sender: Any) {
 
        if let term = searchTextField.text{
            webservice = WebService()
            viewModel = MovieListViewModel(searchTerm: term, webService: webservice){
                    self.tableView.reloadData()
            }
        }
    }
    var viewModel:MovieListViewModel!
    var webservice:WebService!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieSearchResultCellTableViewCell
        cell.movieTitle.text = viewModel.titleForSearchResult(atIndex: indexPath.row)
        let imgUrl = viewModel.imageUrl(atIndex: indexPath.row)
       cell.posterImage.kf.setImage(with: imgUrl)
        return cell
     }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel != nil{
            return viewModel.moviesCount
        }
        return 0
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MovieVCSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "MovieVCSegue",
            let destination = segue.destination as? MovieViewController,
            let index = tableView.indexPathForSelectedRow?.row
        {
            destination.navigationItem.title? = viewModel.title(atIndex: index)
            destination.titleStr = viewModel.title(atIndex: index)
            destination.yearStr =  viewModel.year(atIndex: index)
            destination.ratingStr = viewModel.rating(atIndex: index)
            destination.summaryStr = viewModel.summary(atIndex: index)
           
        }
    }
    
}

