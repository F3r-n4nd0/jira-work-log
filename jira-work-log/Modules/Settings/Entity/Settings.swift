//
//  Settings.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation


public struct Settings: Codable {
    
    static let name = "settings"
    
    public var project: JIRAProject?
    public var version: JIRAVersion?
    public var board: JIRABoard?
    
    func isValid() -> Bool {
        return (project != nil) && (version != nil) && (board != nil)
    }
}

