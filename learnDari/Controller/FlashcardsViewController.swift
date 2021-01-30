//
//  MenuTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

import UIKit

class FlashcardsViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var flashcards: [CategoryItem?]      = []
    var rowSelected : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = K.flashcards
        let data = FlashcardsDataLoader().flashcardsData

        for i in 0..<data.count{
            flashcards.append(CategoryItem(category: data[i].category, flashcards: data[i].flashcards, images: data[i].images))
        }

        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.categoriesTableViewIdentifier, bundle: nil), forCellReuseIdentifier: K.categoriesCellIdentifier)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


extension FlashcardsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flashcards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  K.categoriesCellIdentifier, for: indexPath) as? CategoriesTableViewCell

        cell!.CategoriesLabel.text = flashcards[indexPath.row]?.category
        cell!.temp                 = flashcards[indexPath.row]

        cell!.flashcardsViewController   = self
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 600
    }

    func showAppDetailForApp(flashcard: String){
        self.rowSelected = flashcard
        performSegue(withIdentifier: K.flashcardsToViewSegue, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc         = segue.destination as! ViewController
        vc.rowSelected = self.rowSelected
    }

}

