//
//  ReusableTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/21/21.
//

import UIKit

class ReusableTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var dari: UILabel!
    @IBOutlet weak var english: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
