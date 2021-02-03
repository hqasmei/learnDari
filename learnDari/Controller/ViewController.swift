//
//  ViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/29/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var rowSelected = ""
    var cards: [RowItem]      = []
    var index: Int = 0
    var player : AVAudioPlayer!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var soundButton: UIButton!
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            if UIDevice.current.orientation.isLandscape {
//                imageView.frame = view.bounds
                imageView.image = UIImage(named: "Rectangle_blank_landscape")
               
            } else {
                imageView.image = UIImage(named: "Rectangle_blank")
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        soundButton.isHidden = true
        
        cards = DataLoader(rowSelected: self.rowSelected).items
        englishLabel.text = cards[index].english
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func flipButtonPressed(_ sender: UIButton) {
        let englishState = cards[index].english
        let dariState    = cards[index].dari
        
        if englishLabel.text == englishState{
            englishLabel.text = dariState
            soundButton.isHidden = false
        }
        else{
            englishLabel.text = englishState
            soundButton.isHidden = true
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        index = index + 1
        if index > (cards.count)-1{
            index = 0
        }
        
        englishLabel.text = cards[index].english
        soundButton.isHidden = true
    }
    
    
    @IBAction func previousButtonPressed(_ sender: Any) {
        index = index - 1
        if index < 0 {
            index = 0
        }
        englishLabel.text = cards[index].english
        soundButton.isHidden = true
    }
    
    @IBAction func soundButtonPressed(_ sender: UIButton) {
        if cards[index].sound != ""{
            playSound(sound: cards[index].sound)
        }
    
    }
    
    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "m4a")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
