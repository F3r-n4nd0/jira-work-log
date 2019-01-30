//
//  Router.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class Router {
    
    func executeInMainThread(method: @escaping () -> Void) {
        if Thread.isMainThread {
            method()
        } else {
            DispatchQueue.main.async {
                method()
            }
        }
    }
    
}
