//
//  JIRAIssue.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct JIRAIssue: Codable {
    let id: String
    let key: String
    let fields: JIRAIssueFields
    
    enum CodingKeys: String, CodingKey {
        case id
        case key, fields
    }
}
