//
//  MenuTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var homeTableView: UITableView!
    
    var home: [HomeItem] = [
        HomeItem(itemDari: "Addad", itemEnglish: "Alphabet", image: "addad.png"),
        HomeItem(itemDari: "Huruf",     itemEnglish: "Numbers", image: "huruf.png")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        homeTableView.delegate   = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeReusableCell")
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
       
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeReusableCell", for: indexPath) as! HomeTableViewCell
        cell.homeItemDari.text    = home[indexPath.row].itemDari
        cell.homeItemEnglish.text = home[indexPath.row].itemEnglish
        cell.homeItemImage.image  = UIImage(named: home[indexPath.row].image)
        cell.accessoryType        = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
}
