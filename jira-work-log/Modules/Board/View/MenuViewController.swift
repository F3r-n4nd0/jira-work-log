//
//  MenuViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var boardViewController: BoardViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpInsideSettings(_ sender: UIButton) {
        boardViewController?.selectSettings()
    }
    
    @IBAction func touchUpInsideLogOut(_ sender: UIButton) {
        boardViewController?.selectLogOut()
    }
    
    @IBAction func touchUpInsideBurndownChart(_ sender: UIButton) {
        boardViewController?.selectBurndownChart()
    }

}
