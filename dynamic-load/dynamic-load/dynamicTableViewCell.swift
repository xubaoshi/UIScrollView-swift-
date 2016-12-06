//
//  dynamicTableViewCell.swift
//  dynamic-load
//
//  Created by user on 16/12/6.
//  Copyright © 2016年 user. All rights reserved.
//

import UIKit

class dynamicTableViewCell: UITableViewCell {

    
    @IBOutlet weak var txtLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
