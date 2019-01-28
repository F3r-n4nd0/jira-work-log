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
    }
    
    func subscribeSettings() {
        presenter.settings.asObservable().bind { [weak self] (settings) in
            self?.loadSettingsData(settings: settings)
        }.disposed(by: disposeBag)
    }
    
    func loadSettingsData(settings: Settings) {
        textFieldProject.text = settings.project?.name ?? ""
        textFieldVersion.text = settings.version?.name ?? ""
        textFieldSprint.text = settings.sprint?.name ?? ""
    }
    
    
    @IBAction func selectTapSelectProject(_ sender: UITapGestureRecognizer) {
        presenter.selectProject()
    }
    
    @IBAction func selectTapSelectVersion(_ sender: UITapGestureRecognizer) {
        presenter.selectVersion()
    }
    
    @IBAction func selectTapSelectSprint(_ sender: UITapGestureRecognizer) {
        presenter.selectSprint()
    }

    @IBAction func selectDone(_ sender: UIBarButtonItem) {
        presenter.selectDone()
    }
    
}
