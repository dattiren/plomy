//
//  PostTableViewCell.swift
//  plomy
//
//  Created by ren on 2017/08/22.
//  Copyright © 2017年 ren. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var containText: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
