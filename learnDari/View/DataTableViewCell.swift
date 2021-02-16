//
//  DataTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/25/21.
//

import UIKit
import AVFoundation


protocol MyTableViewCellDelegate: AnyObject{
    func didTapButton(with title: String)
}

class DataTableViewCell: UITableViewCell {

    weak var delegate: MyTableViewCellDelegate?
    
    @IBOutlet weak var dari: UIButton!
    @IBOutlet weak var english: UILabel!
    private var title: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dari.setTitleColor(.brown, for: .normal)
        dari.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
    }

    @IBAction func didTapButton(){
        delegate?.didTapButton(with: title)
    }
    
    func configure(with title: String){
        self.title = title
        dari.setTitle(title, for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
}
