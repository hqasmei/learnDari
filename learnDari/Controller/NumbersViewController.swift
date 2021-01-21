//
//  NumbersViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/20/21.
//

import Foundation
import UIKit

class NumbersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var numbers: [Number] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readInput()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NumbersTableViewCell", bundle: nil), forCellReuseIdentifier: "NumbersReusableCell")
    }
    
    func readInput(){
        if let path = Bundle.main.path(forResource: "NumbersTextFile", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                
                for i in 0..<myStrings.count{
                    let myStringArr = myStrings[i].components(separatedBy: ",")
                    if myStringArr[0] != ""{
                        numbers.append(Number(numberEnglish: myStringArr[1], numberDari:  myStringArr[0], image: "\(myStringArr[0]).png", sound: ""))
                    }
                }
            } catch {
                print("Error")
            }
        }
    }
}

extension NumbersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumbersReusableCell", for: indexPath) as! NumbersTableViewCell
        cell.numberDari.text       = numbers[indexPath.row].numberDari
        cell.numberEnglish.text    = numbers[indexPath.row].numberEnglish
        cell.numberImage.image     = UIImage(named: numbers[indexPath.row].image)
        
        return cell
    }
}

