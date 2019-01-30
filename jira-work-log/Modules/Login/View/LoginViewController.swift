//
//  LoginViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/26/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: ViewController {

    var presenter: LoginPresenter!
    
    @IBOutlet weak var textFieldUseName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldDomain: UITextField!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeLoading()
        subscribeNotification()
    }

    func subscribeLoading() {
        presenter.publishLoading.subscribe(onNext: { [weak self] (result) in
            if result {
                self?.startWaitAnimation()
            } else {
                self?.stopAnimating()
            }
        }).disposed(by: disposeBag)
    }
    
    func subscribeNotification() {
        presenter.publishShowNotification.subscribe(onNext: { [weak self] (result) in
            switch result {
            case .success(let message):
                self?.showInfoMessage(message: message)
            case .failure(let error):
                self?.showErrorMessage(message: error.localizedDescription)
            }
        }).disposed(by: disposeBag)
    }
    
    @IBAction func touchUpInside(_ sender: UIButton) {
        let userName = textFieldUseName.text ?? ""
        let password = textFieldPassword.text ?? ""
        let domain = textFieldDomain.text ?? ""
        presenter.login(user: userName, password: password, domain: domain)
    }

}
