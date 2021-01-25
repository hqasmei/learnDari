//
//  DataViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/25/21.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var row: [RowItem] = []
    var rowSelected = ""
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
       let data = DataLoader(rowSelected: rowSelected).appData
       
       for i in 0..<data.count{
            row.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
       }
       
       tableView.dataSource = self
       tableView.register(UINib(nibName: "ReusableTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
}

   extension DataViewController: UITableViewDataSource{
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return row.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ReusableTableViewCell
           
           cell.dari.text       = row[indexPath.row].dari
           cell.english.text    = row[indexPath.row].english
           cell.imageItem.image = row[indexPath.row].resizeImage(image: UIImage(named: row[indexPath.row].image)!, targetSize: CGSize(width: 50, height: 50))
       
           return cell
       }
   }


