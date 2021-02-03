//
//  DataViewController.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/25/21.
//
import UIKit

class VocabularyViewController: UIViewController{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var expandableSections: [ExpandableSections] = []
    
    var dariLabel: String = ""
    var englishLabel: String = ""
    var image: String = ""
    var sound: String = ""
    
    override func viewDidLoad() {
       super.viewDidLoad()
        self.title = "Vocabulary"
        
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
    

extension VocabularyViewController: UITableViewDataSource, UITableViewDelegate{
    
    // HEADER
    func numberOfSections(in tableView: UITableView) -> Int {
        return expandableSections.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.expandableSections[section].section
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 300))
        headerView.backgroundColor = UIColor.lightGray
        
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.bounds.size.width, height: 28))
        headerLabel.textColor = UIColor.black
        headerLabel.text = self.expandableSections[section].section
        headerLabel.textAlignment = .left
        headerView.addSubview(headerLabel)
        
        let button     = UIButton(frame: CGRect(x:headerView.frame.size.width - 100, y:10, width:100, height:28))
        button.setTitle("Button", for: .normal)
//        button.backgroundColor = .white
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "chevron.right") as UIImage?, for: .normal)
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        button.tag = section
        headerView.addSubview(button)
        
        return headerView
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
//        return footerView
//    }
    
    @objc func handleExpandClose(button: UIButton){
        let section = button.tag

        var indexPaths = [IndexPath]()
        for row in expandableSections[section].items.indices{
            print(0,row)
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = expandableSections[section].isExpanded
        expandableSections[section].isExpanded = !isExpanded
        
        let open  = UIImage(systemName: "chevron.right") as UIImage?
        let close = UIImage(systemName: "chevron.down") as UIImage?
        
        button.setImage(isExpanded ? open : close, for: .normal)
        
        if isExpanded{
            tableView.deleteRows(at: indexPaths, with: .fade)
        }
        else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
       
        
    }
    
    // ROWS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !expandableSections[section].isExpanded{
            return 0
        }
        return self.expandableSections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier:  K.dataCellIdentifier, for: indexPath) as! DataTableViewCell
       cell.accessoryType   = UITableViewCell.AccessoryType.disclosureIndicator
        cell.dari.text      = expandableSections[indexPath.section].items[indexPath.row].dari
       cell.english.text    = expandableSections[indexPath.section].items[indexPath.row].english
       return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
       dariLabel     = expandableSections[indexPath.section].items[indexPath.row].dari
       englishLabel  = expandableSections[indexPath.section].items[indexPath.row].english
       image         = expandableSections[indexPath.section].items[indexPath.row].image
       sound         = expandableSections[indexPath.section].items[indexPath.row].sound
       performSegue(withIdentifier: K.vocabularyToSubDataSegue, sender: self)
   }

       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let vc = segue.destination as! SubDataViewController
           vc.dariText    = self.dariLabel
           vc.englishText = self.englishLabel
           vc.imageText   = self.image
           vc.soundText   = self.sound
       }

}
