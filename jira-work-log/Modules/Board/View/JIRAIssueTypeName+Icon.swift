//
//  JIRAIssueTypeName+Icon.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit

extension JIRAIssueTypeName {
    
    func getIconImage() -> UIImage {
        switch self {
        case .story:
            return R.image.iconIssue()!
        case .bug:
            return R.image.iconBug()!
        }
    }
    
}
