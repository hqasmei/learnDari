//
//  NumbersTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/20/21.
//

import UIKit

class NumbersTableViewCell: UITableViewCell {

    
    @IBOutlet weak var numberImage: UIImageView!
    @IBOutlet weak var numberDari: UILabel!
    @IBOutlet weak var numberEnglish: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
