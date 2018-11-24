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
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if movie != nil {
            titleLabel1.text = movie?.title
            releaseDateLabel.text = movie?.releaseDate
            overviewLabel.text = movie?.overview
            PosterImageView.af_setImage(withURL: (movie?.posterURL)!)
            backDropImageView.af_setImage(withURL: (movie?.backdropURL)!)
        }
    }
}
