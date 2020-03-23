//
//  PeopleListingViewController.swift
//  TheStarWarsLibrary
//
//  Created by Ramiro Diaz on 22/03/2020.
//  Copyright © 2020 Ramiro Diaz. All rights reserved.
//

import Foundation
import UIKit

class PeopleListingViewController: UIViewController {
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    private var dataSource: PeopleDataSource!
    private let refreshControl = UIRefreshControl()
    
    var movie: Movie?
    
    override func viewDidLoad() {
        
        guard let unwrappedMovie = movie else {
            return
        }
        
        super.viewDidLoad()
        self.registerCells()
        self.dataSource = PeopleDataSource(observer: self, movie: unwrappedMovie)
        self.peopleTableView.dataSource = self.dataSource
        self.peopleTableView.rowHeight = PeopleCell.rowHeight
        self.peopleTableView.refreshControl = self.refreshControl
        
        self.refreshControl.tintColor = .lightGray
        
        self.refreshControl.addTarget(self, action: #selector(refreshTableView(_:)), for: .valueChanged)
    
    }
    
    @objc private func refreshTableView(_ sender: Any) {
        self.dataSource.loadPeople()
     }
    
    func registerCells() {
        self.peopleTableView.register(UINib(nibName: PeopleCell.identifier, bundle: nil), forCellReuseIdentifier: PeopleCell.identifier)
    }
}

extension PeopleListingViewController: DataSourceObserver {
    func dataSourceUpdated() {
        DispatchQueue.main.async {[weak self] in
            self?.refreshControl.endRefreshing()
            self?.peopleTableView.reloadData()
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
