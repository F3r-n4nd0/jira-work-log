//
//  LoginRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/26/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class LoginRouter: Router  {
   
    weak var view: LoginViewController?
    
    private let disposeBag = DisposeBag()
    
    static func assembleModule() -> LoginRouter {
        let view = R.storyboard.loginStoryboard.loginViewController()!
        let presenter = LoginPresenter(domain: "fernand0.atlassian.net")
        let interactor = LoginInteractor()
        let router = LoginRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func showListProjects() {
        let listProjectsRouter = ListProjectsRouter.assembleModule()
        executeInMainThread {
            view?.navigationController?.pushViewController(listProjectsRouter.view!, animated: true)
        }
        listProjectsRouter.publishRouter.subscribe { [weak self] (event) in
            switch event {
            case .next: break
                
            case .error(_): break
                
            case .completed:
                self?.view?.navigationController?.popViewController(animated: true)
            }
            }.disposed(by: disposeBag)
       
    }
    
}
