//
//  ResTableViewCell.swift
//  Skylark Delivery
//
//  Created by 雀栎 on 2021/6/10.
//  Copyright © 2021 雀栎. All rights reserved.
//

import UIKit

class ResTableViewCell: UITableViewCell {

    @IBOutlet weak var resImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
