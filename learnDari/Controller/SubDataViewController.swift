//
//  SubDataViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/25/21.
//
import UIKit
import AVFoundation

class SubDataViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var dari: UILabel!
    @IBOutlet weak var english: UILabel!
    
    var player : AVAudioPlayer!
    
    var dariText    = ""
    var englishText = ""
    var imageText   = ""
    var soundText   = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dari.text    = dariText
        english.text = englishText
//        image.image  = UIImage(named: imageText)
    }
    
    @IBAction func pressedSound(_ sender: UIButton) {
        if soundText != ""{
            playSound(sound: soundText)
        }
    }
    
    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "m4a")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

