//
//  AlphabetViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

import UIKit

class AlphabetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var letters: [RowItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = DataLoader(jsonFileName: K.alphabetJsonFile).appData
        
        for i in 0..<data.count{
            letters.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ReusableTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
 
}

extension AlphabetViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ReusableTableViewCell
        
        cell.dari.text       = letters[indexPath.row].dari
        cell.english.text    = letters[indexPath.row].english
        cell.imageItem.image =  UIImage(named: letters[indexPath.row].image)
        
        return cell
    }
}


