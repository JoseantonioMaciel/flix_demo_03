//
//  PosterCell.swift
//  flix_demo_03
//
//  Created by Joseantonio Maciel on 10/12/18.
//  Copyright © 2018 Joseantonio Maciel. All rights reserved.
//

import UIKit

class PosterCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie! {
        willSet(newMovie) {
            posterImageView.af_setImage(withURL: newMovie.posterURL!)
        }
    }
}
