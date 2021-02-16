//
//  MenuTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

import UIKit

class LearnViewController: UIViewController{
    
    // Initialization of the Table View
    @IBOutlet weak var tableView: UITableView!
    
    // Initializes the Category Section data; i.e the category titles and flashcards/images associated with that category
    var categories: [CategoryItem?]      = []
    
    // Initializes the rowSelected data; i.e the flashcard deck selected
    var rowSelected : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = K.learn
        
        let data = FlashcardsDataLoader().learnData
        
        for i in 0..<data.count{
            categories.append(CategoryItem(category: data[i].category, flashcards: data[i].flashcards, images: data[i].images))
        }
        
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.learnTableViewIdentifier, bundle: nil), forCellReuseIdentifier: K.learnCellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
//
//
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
}

extension LearnViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  K.learnCellIdentifier, for: indexPath) as? LearnTableViewCell

        cell!.label.font    = UIFont(name: K.playfairDisplayRegularBold, size: 28)
        cell!.label.text    = categories[indexPath.row]?.category
        cell!.categoryItem  = categories[indexPath.row]
        cell!.learnViewController   = self
        cell?.frame = tableView.bounds
        cell?.layoutIfNeeded()
        cell?.collectionView.reloadData()
        cell?.collectionViewHeight.constant = (cell?.collectionView.collectionViewLayout.collectionViewContentSize.height)!
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }

    func showAppDetailForApp(flashcard: String){
        self.rowSelected = flashcard
        performSegue(withIdentifier: K.learnToViewSegue, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc         = segue.destination as! ViewController
        vc.rowSelected = self.rowSelected
    }

}





