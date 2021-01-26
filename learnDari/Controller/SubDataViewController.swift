//
//  SubDataViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/25/21.
//

import UIKit

class SubDataViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var dari: UILabel!
    @IBOutlet weak var english: UILabel!
    
    var dariText    = ""
    var englishText = ""
    var imageText   = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        dari.text    = dariText
        english.text = englishText
        image.image  = UIImage(named: imageText)
    }
    

}
