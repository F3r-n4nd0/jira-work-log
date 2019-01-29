//
//  IssueTableViewCell.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit

class IssueTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var labelhours: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
