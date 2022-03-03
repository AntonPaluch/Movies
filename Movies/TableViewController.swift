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
//        fetchFilms(from: URLConstants.apiMovies)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return movies?.content.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Title.allCases[section].rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return movies?.content?.randomElement()?.content?.count ?? 1
//        return movies?.content?[0].content?.count ?? 1
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let movies = movies?.content[indexPath.section]
        cell.configure(with: movies?.content ?? [])
        cell.delegate = self
        return cell
    }
    
 

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

  
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let detailVC = segue.destination as? MoviDetailVC {
//            detailVC.configure(with: movies!.content.first!.content.first!)
//        }
//    }
  
    
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
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "MoviDetailVC") as? MoviDetailVC {
        detailVC.configure(with: movie)
        navigationController?.pushViewController(detailVC, animated: true)
      }
    }
}
