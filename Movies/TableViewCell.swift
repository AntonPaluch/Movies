//
//  TableViewCell.swift
//  Movies
//
//  Created by Pandos on 26.02.2022.
//

import UIKit

protocol GenreTableViewCellDelegate: AnyObject {
    func didSelect(movie: Films)
}

class TableViewCell: UITableViewCell {
    
    public weak var delegate: GenreTableViewCellDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var content: [Films] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with movies: [Films]) {
        content = movies
        collectionView.reloadData()
    }
}

extension TableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! CollectionViewCell
        cell.configure(with: content[indexPath.item])
            return cell
    }
    
}

extension TableViewCell : UICollectionViewDelegateFlowLayout {
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension TableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(movie: content[indexPath.item])
 }
}
