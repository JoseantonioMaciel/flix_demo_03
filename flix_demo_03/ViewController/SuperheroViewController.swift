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
    
    var movies:[[String: Any]] = []
    
    
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
        if let posterPathString = movie["poster_path"] as? String{
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        return cell
    }
    
    
        func fetchMovies(){
            let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
                // This will run when the network request returns
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let movies = dataDictionary["results"] as![[String: Any]]
                    self.movies = movies
                    self.collectionView.reloadData()
                    //self.collectionView.endRefreshing()
                    
                }
            }
            task.resume()
        }
        
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    
    }
}

