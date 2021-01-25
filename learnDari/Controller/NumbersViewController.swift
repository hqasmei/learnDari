//
//  NumbersViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/20/21.
//

import Foundation
import UIKit

class NumbersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var numbers: [RowItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = DataLoader(jsonFileName: K.numbersJsonFile).appData
        
        for i in 0..<data.count{
            numbers.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ReusableTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
}

extension NumbersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ReusableTableViewCell
        
        cell.dari.text       = numbers[indexPath.row].dari
        cell.english.text    = numbers[indexPath.row].english
        cell.imageItem.image = UIImage(named: numbers[indexPath.row].image)
        
        return cell
    }
}

