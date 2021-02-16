//
//  ViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/29/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var flashcardImage: UIImageView!
    @IBOutlet weak var flashcardButton: UIButton!
    var player : AVAudioPlayer!
    
    var rowSelected = ""
    var index: Int = 0
    var cards: [RowItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = rowSelected
        
        let data = DataLoader(rowSelected: rowSelected).appData

        for i in 0..<data.count{
            cards.append(RowItem(dari: data[i].dari, english:  data[i].english, image:  data[i].image, sound:  data[i].sound))
        }
        flashcardImage.image = UIImage(named: "start")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.dataTableViewIdentifier, bundle: nil), forCellReuseIdentifier: K.dataCellIdentifier)
    }
    
    @IBAction func flashcardButtonPressed(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc         = segue.destination as! FlashcardsViewController
        vc.rowSelected = self.rowSelected
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    // HEADER
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "TERMS"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1)

        let headerLabel = UILabel(frame: CGRect(x: 20, y:12.5 , width:tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: K.proximaNovaRegular, size: 16)
        headerLabel.textColor = UIColor(red: 132/255.0, green: 132/255.0, blue: 138/255.0, alpha: 1)

        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)

        return headerView
    }

    // ROWS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier:  K.dataCellIdentifier, for: indexPath) as! DataTableViewCell
        
       cell.configure(with: cards[indexPath.row].dari)
       cell.english.text   = cards[indexPath.row].english
       cell.delegate = self
        
       return cell
    }

}

extension ViewController: MyTableViewCellDelegate{
    func didTapButton(with title: String) {
        if title != ""{
            playSound(sound: title)
        }
    }
    
    func playSound(sound: String) {
        
        let url = Bundle.main.url(forResource: sound, withExtension: "m4a")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
