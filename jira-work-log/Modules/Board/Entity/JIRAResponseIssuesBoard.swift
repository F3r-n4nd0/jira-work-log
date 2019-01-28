//
//  JIRAResponseIssuesBoard.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct JIRAResponseIssuesBoard: Codable {
    let expand: String
    let startAt, maxResults, total: Int
    let issues: [JIRAIssue]
}
