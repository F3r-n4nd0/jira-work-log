//
//  LoginRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/26/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class LoginRouter {
   
    weak var view: LoginViewController?
    
    static func assembleModule() -> LoginRouter {
        let view = R.storyboard.loginStoryboard.loginViewController()!
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
}
