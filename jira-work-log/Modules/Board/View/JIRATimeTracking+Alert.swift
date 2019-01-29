//
//  JIRATimeTracking+Alert.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import UIKit


extension JIRATimetracking {
    
    func getColor() -> UIColor {
        if self.originalEstimateSeconds < (self.timeSpentSeconds ?? 0)  {
            return R.color.bugColor()!
        } else {
            return R.color.issueColor()!
        }
    }
    
}
