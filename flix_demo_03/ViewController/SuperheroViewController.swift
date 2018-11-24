//
//  SuperheroViewController.swift
//  flix_demo_03
//
//  Created by Joseantonio Maciel on 10/12/18.
//  Copyright © 2018 Joseantonio Maciel. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource{
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies:[Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //layout.minimumInteritemSpacing = 6
        //layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerLine: CGFloat = 2
        let interItemSpacingTotal = layout.minimumLineSpacing * (cellsPerLine - 1)
        let width = collectionView.frame.size.width / cellsPerLine
        layout.itemSize = CGSize(width: width, height: width * (3/2))
 

       fetchMovies()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

        let movie = movies[indexPath.item]
        cell.movie = movie
        
        return cell
    }
    
    
        func fetchMovies(){
            MoviesApiManager().superheroMovies { (movies: [Movie]?, error: Error?) in
                if let movies = movies {
                    self.movies = movies
                    self.collectionView.reloadData()
                }
            }
    }
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    
    }
}


