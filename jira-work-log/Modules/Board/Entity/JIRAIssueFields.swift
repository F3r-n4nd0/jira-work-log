//
//  JIRAIssueFields.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct JIRAIssueFields: Codable {
    
    let timetracking: JIRATimetracking
    let summary: String
    
    enum CodingKeys: String, CodingKey {
        case timetracking
        case summary
    }
}
