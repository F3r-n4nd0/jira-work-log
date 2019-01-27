//
//  Result.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(result: T)
    case failure(error: Error)
}

