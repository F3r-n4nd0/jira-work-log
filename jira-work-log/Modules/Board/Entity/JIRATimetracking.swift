//
//  JIRATimetracking.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct JIRATimetracking: Codable {
    let originalEstimate: String
    let remainingEstimate, timeSpent: String?
    let originalEstimateSeconds: Int
    let remainingEstimateSeconds, timeSpentSeconds: Int?
}
