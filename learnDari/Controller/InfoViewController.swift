//
//  InfoViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 2/5/21.
//

import UIKit
import MessageUI
import SafariServices

class InfoViewController: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var clickHereButton: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    var expandableSections: [ExpandableSections] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feedback"
        feedbackLabel.font = UIFont(name: K.proximaNovaRegular, size: 24)
        feedbackLabel.text = "Want to provide us feedback?"
        clickHereButton.titleLabel?.font = UIFont(name: K.proximaNovaRegular, size: 24)!
        clickHereButton.setTitle("Click Here", for: .normal)
//        self.title = K.info
//        tableView.tableFooterView = UIView()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: K.dataTableViewIdentifier, bundle: nil), forCellReuseIdentifier: K.dataCellIdentifier)
        
    }
    
    @IBAction func clickHereButtonPressed(_ sender: UIButton) {
        goToForm()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    func goToForm(){
        guard let url = URL(string: "https://forms.gle/2Vx2xkLMH7XTEvNU7") else{
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
}

//extension InfoViewController: UITableViewDelegate, UITableViewDataSource{
    
    // HEADER
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40.0
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "HI"
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        headerView.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 247/255.0, alpha: 1)
//
//        let headerLabel = UILabel(frame: CGRect(x: 20, y:12.5 , width:tableView.bounds.size.width, height: tableView.bounds.size.height))
//        headerLabel.font = UIFont(name: K.proximaNovaRegular, size: 16)
//        headerLabel.textColor = UIColor(red: 132/255.0, green: 132/255.0, blue: 138/255.0, alpha: 1)
//
//        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
//        headerLabel.sizeToFit()
//        headerView.addSubview(headerLabel)
//
//        return headerView
//    }
    
    
    // BODY
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier:  K.dataCellIdentifier, for: indexPath) as! DataTableViewCell
////        cell.dari.text    = "Feedback"
//        cell.english.text = ""
//        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "InfoToInfoDetail", sender: self)
//    }
//
//}

