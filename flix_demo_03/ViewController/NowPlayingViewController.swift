//
//  NowPlayingViewController.swift
//  flix_demo_03
//
//  Created by Joseantonio Maciel on 10/4/18.
//  Copyright © 2018 Joseantonio Maciel. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController:
UIViewController,UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    
    var movies: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
   
    super.viewDidLoad()
        TableView.rowHeight = 200
        
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        TableView.insertSubview(refreshControl, at: 0)
        TableView.dataSource = self
        fetchMovies()
    }
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchMovies()
    }
    func fetchMovies(){
        MoviesApiManager().nowPlayingMovies { (movies: [Movie]?, error: Error?) in
            if let movies = movies {
                self.movies = movies
                self.TableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movie = movies[indexPath.row]
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender  as! UITableViewCell
        if let indexPath = TableView.indexPath(for: cell)
        {
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
    }

}
