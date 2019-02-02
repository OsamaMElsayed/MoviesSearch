//
//  MovieViewController.swift
//  MoviesSearch
//
//  Created by osama on 11/19/18.
//  Copyright © 2018 osama. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleStr
        yearLabel.text = yearStr
        ratingLabel.text = ratingStr
        summaryLabel.text = summaryStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var  titleStr:String!
    var  yearStr:String!
    var  ratingStr:String!
    var  summaryStr:String!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    

}
