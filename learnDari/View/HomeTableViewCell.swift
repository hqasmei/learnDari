//
//  HomeTableViewCell.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeItemDari: UILabel!
    @IBOutlet weak var homeItemEnglish: UILabel!
    @IBOutlet weak var homeItemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
