//
//  TableViewController.swift
//  Movies
//
//  Created by Pandos on 23.02.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var movies: Content?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
        fetchData(from: URLConstants.apiMovies)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return movies?.content.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Title.allCases[section].rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let movies = movies?.content[indexPath.section]
        cell.configure(with: movies?.content ?? [])
        cell.delegate = self
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { movies in
            self.movies = movies
            print(movies)
            self.tableView.reloadData()
        }
    }
}

extension TableViewController: GenreTableViewCellDelegate {
    
    func didSelect(movie: Films) {
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "MoviDetailVC") as? MovieDetailVC {
        detailVC.configure(with: movie)
        navigationController?.pushViewController(detailVC, animated: true)
      }
    }
}
