//
//  ViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import UIKit
import SCLAlertView
import NVActivityIndicatorView

class ViewController:  UIViewController, NVActivityIndicatorViewable {
    
    func startWaitAnimation() {
        executeInMainThread {
            self.startAnimating()
        }
    }
    
    func stopWaitAnimation() {
        executeInMainThread {
            self.stopAnimating()
        }
    }
    
    func showErrorMessage(message: String) {
        executeInMainThread {
            SCLAlertView().showError("Error", subTitle: message)
        }
    }
    
    func showInfoMessage(message: String) {
        executeInMainThread {
            SCLAlertView().showInfo("Info", subTitle: message)
        }
    }
    
    func executeInMainThread(method: @escaping () -> Void) {
        if Thread.isMainThread {
            method()
        } else {
            DispatchQueue.main.sync {
                method()
            }
        }
    }

}
