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
    
    var dariLabel    = ""
    var englishLabel = ""
    var image        = ""
    var sound        = ""
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
       let data = DataLoader(rowSelected: rowSelected).appData
       
       for i in 0..<data.count{
            row.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
       }
       
       tableView.delegate = self
       tableView.dataSource = self
       tableView.register(UINib(nibName: K.dataTableViewIdentifier, bundle: nil), forCellReuseIdentifier: K.dataCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
    }
}

extension DataViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        dariLabel    = row[indexPath[1]].dari
        englishLabel = row[indexPath[1]].english
        image        = row[indexPath[1]].image
        sound        = row[indexPath[1]].sound
        performSegue(withIdentifier: K.dataToSubDataSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SubDataViewController
        vc.dariText    = self.dariLabel
        vc.englishText = self.englishLabel
        vc.imageText   = self.image
        vc.soundText   = self.sound
    }
    
}

extension DataViewController: UITableViewDataSource{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return row.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier:  K.dataCellIdentifier, for: indexPath) as! DataTableViewCell
       cell.accessoryType   = UITableViewCell.AccessoryType.disclosureIndicator
       cell.dari.text       = row[indexPath.row].dari
       cell.english.text    = row[indexPath.row].english
    
       return cell
   }
}
