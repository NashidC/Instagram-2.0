//
//  TimeLineCell.swift
//  Instagram 2.0
//
//  Created by Nashid  on 3/26/16.
//  Copyright © 2016 CodePath. All rights reserved.
//

import UIKit
import ParseUI

class TimeLineCell: UITableViewCell {

    @IBOutlet weak var pictureView: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
