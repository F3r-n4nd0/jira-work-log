//
//  JIRAIssuetype.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct JIRAIssuetype: Codable {
    let id: String
    let name: JIRAIssueTypeName
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
}
