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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        let data = DataLoader(jsonFileName: K.homeJsonFile).appData
        
        for i in 0..<data.count{
            home.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
        }
        
        homeTableView.delegate   = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "ReusableTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
}


extension HomeViewController: UITableViewDelegate{
    func tableView(_ homeTableView: UITableView, didSelectRowAt indexPath: IndexPath){
        homeTableView.deselectRow(at: indexPath, animated: true)
        
        let scene = indexPath.row
        switch scene{
            case 0:
                performSegue(withIdentifier: "HomeToAlphabet", sender: self)
            case 1:
                performSegue(withIdentifier: "HomeToNumbers", sender: self)
            case 2:
                performSegue(withIdentifier: "HomeToGreetings", sender: self)
            case 3:
                performSegue(withIdentifier: "HomeToPronouns", sender: self)
            default:
                performSegue(withIdentifier: "HomeToAlphabet", sender: self)
        }
    }
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ homeTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return home.count
    }
    
    func tableView(_ homeTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ReusableTableViewCell
        cell.dari.text       = home[indexPath.row].dari
        cell.english.text    = home[indexPath.row].english
        cell.imageItem.image = home[indexPath.row].resizeImage(image: UIImage(named: home[indexPath.row].image)!, targetSize: CGSize(width: 100, height: 100))
        cell.accessoryType   = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
}
