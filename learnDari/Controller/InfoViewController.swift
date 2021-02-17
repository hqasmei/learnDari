//
//  InfoViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 2/5/21.
//

import UIKit
import MessageUI
import SafariServices

class InfoViewController: UIViewController{

    
    @IBOutlet weak var feedbackLabel: UILabel!
    var expandableSections: [ExpandableSections] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Info"
        feedbackLabel.font = UIFont(name: K.proximaNovaRegular, size: 24)
        feedbackLabel.text = "Want to provide us feedback? \n Email us at learndari1@gmail.com"
    }
    
}
