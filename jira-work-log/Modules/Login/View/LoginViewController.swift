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
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
        presenter.initLoad(user: userName, password: password)
    }

}
