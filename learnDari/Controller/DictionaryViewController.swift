//
//  DataViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/25/21.
//
import UIKit

class DictionaryViewController: UIViewController{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var expandableSections: [ExpandableSections] = []
    
    var dariLabel: String = ""
    var englishLabel: String = ""
    var image: String = ""
    var sound: String = ""
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        self.title = K.dictionary
        
        for sec in K.sectionData{
            let expand  = false
            let section = sec.key
            let items   = DataLoader(rowSelected: section).items
            expandableSections.append(ExpandableSections(isExpanded: expand, section: section, items: items))
       }
       expandableSections.sort { (lhs: ExpandableSections, rhs: ExpandableSections) -> Bool in
        // you can have additional code here
        return lhs.section < rhs.section
       }
        
       tableView.delegate = self
       tableView.dataSource = self
       tableView.register(UINib(nibName: K.dataTableViewIdentifier, bundle: nil), forCellReuseIdentifier: K.dataCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
          self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
    }
}
    

extension DictionaryViewController: UITableViewDataSource, UITableViewDelegate{
    
    // HEADER
    func numberOfSections(in tableView: UITableView) -> Int {
        return expandableSections.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.expandableSections[section].section.uppercased()
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
        return self.expandableSections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier:  K.dataCellIdentifier, for: indexPath) as! DataTableViewCell
       cell.dari.text      = expandableSections[indexPath.section].items[indexPath.row].dari
       cell.english.text    = expandableSections[indexPath.section].items[indexPath.row].english
       return cell
    }

}
