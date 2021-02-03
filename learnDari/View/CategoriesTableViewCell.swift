//
//  CategoriesTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/28/21.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    var flashcardsViewController: FlashcardsViewController?
    var flashcardDeck : Int = 0
    var temp: CategoryItem?
    var rowSelected : String = ""
    @IBOutlet weak var CategoriesLabel: UILabel!
    @IBOutlet weak var CategoriesCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CategoriesCollectionView.delegate   = self
        CategoriesCollectionView.dataSource = self
        CategoriesCollectionView.register(UINib(nibName: K.flashcardsCollectionViewIdentifier, bundle: nil), forCellWithReuseIdentifier: K.flashcardsCellIdentifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cards = (temp?.flashcards.count)!
        return cards
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.flashcardsCellIdentifier, for: indexPath) as! FlashcardsCollectionViewCell

        cell.imageLabel.image = UIImage(named: (temp?.images[indexPath.row])!)
        cell.textLabel.text   = temp?.flashcards[indexPath.row]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout colectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 170, height: 230)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = collectionView.cellForItem(at: indexPath)! as! FlashcardsCollectionViewCell
        let flashcard = currentCell.textLabel.text!
        flashcardsViewController?.showAppDetailForApp(flashcard: flashcard)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
