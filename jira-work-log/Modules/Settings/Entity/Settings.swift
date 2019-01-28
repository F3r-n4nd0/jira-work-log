//
//  Settings.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation


public struct Settings: Codable {
    public var project: JIRAProject?
    public var version: JIRAVersion?
    public var sprint: JIRAProject?
}

