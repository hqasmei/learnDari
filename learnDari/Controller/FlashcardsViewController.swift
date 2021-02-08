//
//  FlashcardsViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 2/6/21.
//

import UIKit
import AVFoundation

class FlashcardsViewController: UIViewController {

  
    @IBOutlet weak var flashcardImage: UIImageView!
    @IBOutlet weak var wordImage: UIImageView!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var flashcardImagePressed: UIButton!
    @IBOutlet weak var dariLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    var player : AVAudioPlayer!
    var pressed: Bool = false
    var index: Int    = 0
    var cards: [RowItem]      = []
    var rowSelected = ""
    let qState = UIImage(named: "flashcard_Rectangle_tap")
    let aState = UIImage(named: "flashcard_Rectangle")
 
    override func viewDidLoad() {
        super.viewDidLoad()
        flashcardImage.addSubview(wordImage)
        
        cards = DataLoader(rowSelected: self.rowSelected).items
        dariLabel.font    = UIFont(name: K.proximaNovaRegular, size: 24)
        dariLabel.text    = cards[index].dari
        englishLabel.font = UIFont(name: K.proximaNovaRegular, size: 24)
        englishLabel.text = cards[index].english
        wordImage.image   = UIImage(named: cards[index].image)
        
        flashcardImage.image  = UIImage(named: "flashcard_Rectangle_tap")
        pressed               = false
        soundButton.isHidden  = true
        dariLabel.isHidden    = false
        englishLabel.isHidden = true
        
    }
    
    
    
    @IBAction func flashcardImagePressed(_ sender: UIButton) {
        pressed = !pressed
        
        if pressed{
            flashcardImage.image = aState
            soundButton.isHidden = false
            englishLabel.isHidden   = false
        }
        else{
            flashcardImage.image = qState
            soundButton.isHidden = true
            englishLabel.isHidden   = true
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        index = index + 1
        if index > (cards.count)-1{
            index = 0
        }
        dariLabel.text  = cards[index].dari
        englishLabel.text    = cards[index].english
        wordImage.image      = UIImage(named: cards[index].image)
        flashcardImage.image = qState
        soundButton.isHidden = true
        englishLabel.isHidden = true
        pressed = false
    }
    
    @IBAction func previousButtonPressed(_ sender: UIButton) {
        index = index - 1
        if index < 0 {
            index = 0
        }
        dariLabel.text    = cards[index].dari
        englishLabel.text = cards[index].english
        wordImage.image   = UIImage(named: cards[index].image)
        flashcardImage.image  = qState
        soundButton.isHidden = true
        englishLabel.isHidden = true
        pressed = false
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
