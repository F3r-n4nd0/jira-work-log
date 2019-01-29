//
//  ViewWithBorderRoundCorner.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/26/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit

class ViewWithBorderRoundCorner: UIView {
    
    @IBInspectable var colorBorder: UIColor = UIColor.black {
        didSet {
            self.layer.borderColor = colorBorder.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.02 {
        didSet {
            self.layer.cornerRadius = self.bounds.size.width * cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBorderRoundCorner()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setBorderRoundCorner()
    }
    
    func setBorderRoundCorner() {
        self.layer.cornerRadius = self.bounds.size.width * cornerRadius
        self.layer.borderWidth = 1
    }
    
}
