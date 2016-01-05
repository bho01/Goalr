//
//  GLRSubTableViewCell.swift
//  ParseStarterProject-Swift
//
//  Created by Ivan Chau on 12/30/15.
//  Copyright © 2015 Ivan Chau. All rights reserved.
//

import UIKit

class GLRSubTableViewCell: UITableViewCell {
    @IBOutlet weak var subGoal : UILabel?
    @IBOutlet weak var datez : UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
