//
//  AlphabetTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

import UIKit

class AlphabetTableViewCell: UITableViewCell {
        
    @IBOutlet weak var letterImage: UIImageView!
    @IBOutlet weak var letterDari: UILabel!
    @IBOutlet weak var letterEnglish: UILabel!
    
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        
    }