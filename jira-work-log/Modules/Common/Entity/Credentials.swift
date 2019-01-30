//
//  Credentials.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/30/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct Credentials: Codable {
    
    static let name = "credentials"
    
    let user, password, domain: String
    
    init(user: String, password: String, domain: String) {
        self.user = user
        self.password = password
        self.domain = domain
    }
}
