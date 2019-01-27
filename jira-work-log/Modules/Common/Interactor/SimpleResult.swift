//
//  SimpleResult.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

public enum SimpleResult {
    case success()
    case failure(error: Error)
}
