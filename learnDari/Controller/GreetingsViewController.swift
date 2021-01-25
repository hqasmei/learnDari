//
//  GreetingsViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/21/21.
//

import UIKit

class GreetingsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var greetings: [RowItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = DataLoader(jsonFileName: K.greetingsJsonFile).appData
        
        for i in 0..<data.count{
            greetings.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ReusableTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
   
}

extension GreetingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return greetings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ReusableTableViewCell
        
        cell.dari.text       = greetings[indexPath.row].dari
        cell.english.text    = greetings[indexPath.row].english
        cell.imageItem.image = greetings[indexPath.row].resizeImage(image: UIImage(named: greetings[indexPath.row].image)!, targetSize: CGSize(width: 100, height: 100))
        
        return cell
    }
}
