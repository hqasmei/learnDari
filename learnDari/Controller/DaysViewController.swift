//
//  DaysViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/25/21.
//

import UIKit

class DaysViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var days: [RowItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = DataLoader(jsonFileName: K.daysJsonFile).appData
        
        for i in 0..<data.count{
            days.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ReusableTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
}

extension DaysViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ReusableTableViewCell
        
        cell.dari.text       = days[indexPath.row].dari
        cell.english.text    = days[indexPath.row].english
        cell.imageItem.image = days[indexPath.row].resizeImage(image: UIImage(named: days[indexPath.row].image)!, targetSize: CGSize(width: 75, height: 75))
        
        return cell
    }
}
