//
//  SettingsViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import RxSwift

class SettingsViewController: UIViewController {

    var presenter: SettingsPresenter!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var textFieldProject: UITextField!
    @IBOutlet weak var textFieldVersion: UITextField!
    @IBOutlet weak var textFieldSprint: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeSettings()
        // Do any additional setup after loading the view.
    }
    
    func subscribeSettings() {
        presenter.settings.asObservable().bind { [weak self] (settings) in
            self?.loadSettingsData(settings: settings)
        }.disposed(by: disposeBag)
    }
    
    func loadSettingsData(settings: Settings) {
        textFieldProject.text = settings.project?.name ?? ""
    }
    
    
    @IBAction func selectTapSelectProject(_ sender: UITapGestureRecognizer) {
        presenter.selectProject()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
