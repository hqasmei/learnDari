//
//  MenuTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var homeTableView: UITableView!
    
    var home: [RowItem] = []
    var rowSelected : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = K.home
        
        let data = DataLoader(rowSelected: K.home).appData
        
        for i in 0..<data.count{
            home.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
        }
        
        homeTableView.delegate   = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: K.cellTableViewIdentifier, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let selectionIndexPath = self.homeTableView.indexPathForSelectedRow {
            self.homeTableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
    }
}


extension HomeViewController: UITableViewDelegate{
    func tableView(_ homeTableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        rowSelected = homeTableView.deselectRow(at: indexPath, animated: true)
        let currentCell = homeTableView.cellForRow(at: indexPath)! as! ReusableTableViewCell
        rowSelected = currentCell.english!.text!
        performSegue(withIdentifier: K.homeToDataSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DataViewController
        vc.rowSelected = self.rowSelected

    }
}

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ homeTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return home.count
    }
    
    func tableView(_ homeTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = homeTableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! ReusableTableViewCell
        cell.dari.text       = home[indexPath.row].dari
        cell.english.text    = home[indexPath.row].english
        cell.imageItem.image = home[indexPath.row].resizeImage(image: UIImage(named: home[indexPath.row].image)!, targetSize: CGSize(width: 100, height: 100))
        cell.accessoryType   = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
}
