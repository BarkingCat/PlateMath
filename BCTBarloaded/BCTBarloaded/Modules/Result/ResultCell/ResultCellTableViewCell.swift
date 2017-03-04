//
//  ResultCellTableViewCell.swift
//  BCTBarloaded
//
//  Created by Rakesh B SablePatil on 14/05/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import UIKit

class ResultCellTableViewCell: UITableViewCell {

    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
