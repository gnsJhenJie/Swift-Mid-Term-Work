//
//  ShopsTableViewCell.swift
//  20180223
//
//  Created by student on 2018/3/2.
//  Copyright © 2018年 TNFSH104. All rights reserved.
//

import UIKit

class ShopsTableViewCell: UITableViewCell {

    @IBOutlet weak var caImage: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Adress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
