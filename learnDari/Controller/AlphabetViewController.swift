//
//  AlphabetViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

import UIKit

class AlphabetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var letters: [Letter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readInput()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AlphabetTableViewCell", bundle: nil), forCellReuseIdentifier: "AlphabetReusableCell")
    }
    
    func readInput(){
        if let path = Bundle.main.path(forResource: "AlphabetsTextFile", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                
                for i in 0..<myStrings.count{
                    let myStringArr = myStrings[i].components(separatedBy: ",")
                    
                    if myStringArr[0] != ""{
                        letters.append(Letter(letterDariName: myStringArr[0], letterEnglishName: myStringArr[1], image: "\(myStringArr[0]).png", sound: ""))
                    }
                }
            } catch {
                print("Error")
            }
        }
    }
}

extension AlphabetViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlphabetReusableCell", for: indexPath) as! AlphabetTableViewCell
        
        cell.letterDari.text      = letters[indexPath.row].letterDariName
        cell.letterEnglish.text   = letters[indexPath.row].letterEnglishName
        cell.letterImage.image    =  UIImage(named: letters[indexPath.row].image)
        
        return cell
    }
}


