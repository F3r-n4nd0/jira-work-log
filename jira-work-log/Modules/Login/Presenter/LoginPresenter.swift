//
//  LoginPresenter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/26/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class LoginPresenter {
    
    var router: LoginRouter!
    var interactor: LoginInteractor!
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    
    let domain: String
    
    init(domain: String) {
        self.domain = domain
    }
    
    func initLoad(user: String, password: String) {
        do {
            publishLoading.onNext(true)
            try interactor.loginJira(domain: domain, user: user, password: password) { [weak self] (result) in
                self?.publishLoading.onNext(false)
                switch result {
                case .success(let result):
                    if result {
                        self?.router.showSettings()
                    } else {
                        self?.publishShowNotification.onNext(Result.success(result: "Incorrect user or password"))
                    }
                case .failure(let error):
                    self?.publishShowNotification.onNext(Result.failure(error: error))
                }
            }
        } catch (let error) {
            publishShowNotification.onNext(Result.failure(error: error))
        }
    }
}
