//
//  PronounsViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/24/21.
//

import UIKit

class PronounsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var pronouns: [RowItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = DataLoader(jsonFileName: K.pronounsJsonFile).appData
        
        for i in 0..<data.count{
            pronouns.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ReusableTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
}

extension PronounsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pronouns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ReusableTableViewCell
        
        cell.dari.text       = pronouns[indexPath.row].dari
        cell.english.text    = pronouns[indexPath.row].english
        cell.imageItem.image = pronouns[indexPath.row].resizeImage(image: UIImage(named: pronouns[indexPath.row].image)!, targetSize: CGSize(width: 50, height: 50))
        
        return cell
    }
}
