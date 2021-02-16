//
//  FlashcardsViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 2/6/21.
//

import UIKit
import AVFoundation

class FlashcardsViewController: UIViewController {

  
  
    @IBOutlet weak var barButton: UIButton!
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
    var orderedCards: [RowItem]      = []
    var shuffledCards: [RowItem]      = []
    var rowSelected = ""
    let qState = UIImage(named: "flashcard_Rectangle_tap")
    let aState = UIImage(named: "flashcard_Rectangle")
 
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flashcardImage.addSubview(wordImage)
        orderedCards = DataLoader(rowSelected: self.rowSelected).items
        shuffledCards = orderedCards
        cards = orderedCards
        restart(deck: orderedCards)
    }
    
    
    
    func restart(deck: [RowItem]){
        dariLabel.font    = UIFont(name: K.proximaNovaRegular, size: 24)
        dariLabel.text    = deck[index].dari
        englishLabel.font = UIFont(name: K.proximaNovaRegular, size: 24)
        englishLabel.text = deck[index].english
        wordImage.image   = UIImage(named: deck[index].image)
        
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
    
   
    @IBAction func barButtonPressed(_ sender: UIButton) {
        let state = barButton.title(for: .normal)!
        
        if  state == "Shuffle"{
            cards = shuffledCards.shuffled()
            barButton.setTitle("Ordered", for: .normal)
        }
        else if state == "Ordered"{
            cards = orderedCards
            barButton.setTitle("Shuffle", for: .normal)
        }
        restart(deck: cards)
    }

    
    
}
