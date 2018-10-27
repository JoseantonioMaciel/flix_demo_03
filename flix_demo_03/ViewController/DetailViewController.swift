//
//  DetailViewController.swift
//  flix_demo_03
//
//  Created by Joseantonio Maciel on 10/11/18.
//  Copyright © 2018 Joseantonio Maciel. All rights reserved.
//

import UIKit
enum MoiveKeys {
    static let title = "title"
    static let backdrop = "backdrop_path"
    static let posterPath = "poster_path"
}
class DetailViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var PosterImageView: UIImageView!
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie{
            titleLabel1.text = movie[MoiveKeys.title] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            let backdropPathString = movie[MoiveKeys.backdrop] as! String
            let posterPathString = movie[MoiveKeys.posterPath]as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            backDropImageView.af_setImage(withURL: backdropURL)
            
            let posterPathURL = URL(string: baseURLString + posterPathString)!
            PosterImageView.af_setImage(withURL: posterPathURL)
            
            
            
            
        }
  
    }
    
}
