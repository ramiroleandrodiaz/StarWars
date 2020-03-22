//
//  MovieListingViewController.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 22/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import UIKit

protocol MovieListingDelegate: NSObject {
    func didSelectMovie(movie: Movie?)
}

class MovieListingViewController: UIViewController {

    

    @IBOutlet weak var moviesTableView: UITableView!
    
    private var dataSource: MovieDataSource!
    private let refreshControl = UIRefreshControl()

    weak var delegate: MovieListingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.dataSource = MovieDataSource(observer: self)
        self.moviesTableView.dataSource = self.dataSource
        self.moviesTableView.delegate = self
        self.moviesTableView.rowHeight = MovieCell.rowHeight
        self.moviesTableView.refreshControl = self.refreshControl

        self.refreshControl.tintColor = .lightGray
        
        self.refreshControl.addTarget(self, action: #selector(refreshTableView(_:)), for: .valueChanged)

    }
    
    @objc private func refreshTableView(_ sender: Any) {
        self.dataSource.loadMovies()
     }
    
    func registerCells() {
        self.moviesTableView.register(UINib(nibName: MovieCell.identifier, bundle: nil), forCellReuseIdentifier: MovieCell.identifier)
    }

}

extension MovieListingViewController: DataSourceObserver {
    func dataSourceUpdated() {
        DispatchQueue.main.async {[weak self] in
            self?.refreshControl.endRefreshing()
            self?.moviesTableView.reloadData()
        }
    }
    
    func dataSourceFailed() {
        DispatchQueue.main.async {[weak self] in
            self?.refreshControl.endRefreshing()
            let alert = UIAlertController(title: NSLocalizedString("Error", comment: "Error"), message: NSLocalizedString("An error ocurred retrieving the data", comment: "Error message"), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
}

extension MovieListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print()
    }
}
