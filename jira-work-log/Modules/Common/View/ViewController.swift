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
        self.startAnimating()
    }
    
    func stopWaitAnimation() {
        self.stopAnimating()
    }
    
    func showErrorMessage(message: String) {
        executeInMainThread {
            SCLAlertView().showError(message, subTitle: "Error")
        }
    }
    
    func showInfoMessage(message: String) {
        executeInMainThread {
            SCLAlertView().showInfo(message, subTitle: "Info")
        }
    }
    
    func executeInMainThread(method: () -> Void) {
        if Thread.isMainThread {
            method()
        } else {
            DispatchQueue.main.sync {
                method()
            }
        }
    }

}
