//
//  MenuTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

import UIKit

class HomeViewController: UIViewController{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var home: [RowItem]      = []
    var rowSelected : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = K.home
        
        let data = DataLoader(rowSelected: K.home).appData
        
        for i in 0..<data.count{
            home.append(RowItem(dari: data[i].dari , english: data[i].english  , image: data[i].image   , sound: data[i].sound))
        }
        
        collectionView.delegate   = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: K.homeCollectionViewIdentifier, bundle: nil), forCellWithReuseIdentifier: K.homeCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
}


extension HomeViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = collectionView.cellForItem(at: indexPath)! as! HomeCollectionViewCell
        rowSelected     = currentCell.textLabel!.text!
        performSegue(withIdentifier: K.homeToDataSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DataViewController
        vc.rowSelected = self.rowSelected
    }
}

extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return home.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell            = collectionView.dequeueReusableCell(withReuseIdentifier: K.homeCellIdentifier, for: indexPath) as! HomeCollectionViewCell
        cell.textLabel.text = home[indexPath.row].english
        return cell
    }
    
    
   
}

