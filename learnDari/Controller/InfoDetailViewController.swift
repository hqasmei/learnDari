//
//  InfoDetailViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 2/10/21.
//

import UIKit
import SafariServices
import MessageUI

class InfoDetailViewController: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feedback"
        guard let url = URL(string: "https://forms.gle/2Vx2xkLMH7XTEvNU7") else{
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    

}
