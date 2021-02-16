//
//  LearnTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 2/5/21.
//

import UIKit

class LearnTableViewCell: UITableViewCell {

    var learnViewController: LearnViewController?
    var categoryItem: CategoryItem?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionViewHeight.constant = 20
        collectionView.delegate   = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: K.categoryCollectionViewIdentifier, bundle: nil), forCellWithReuseIdentifier: K.categoryCellIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LearnTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cards = (categoryItem?.flashcards.count)!
        return cards
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.categoryCellIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.cardImage.image = UIImage(named: (categoryItem?.images[indexPath.row])!)
        cell.cardName = (categoryItem?.flashcards[indexPath.row])!
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout colectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 190, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = collectionView.cellForItem(at: indexPath)! as! CategoryCollectionViewCell
        let flashcard   = currentCell.cardName
        learnViewController?.showAppDetailForApp(flashcard: flashcard)
    }
    
    
    
    
}
