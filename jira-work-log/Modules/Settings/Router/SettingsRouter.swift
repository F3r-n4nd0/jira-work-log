//
//  SettingsRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class SettingsRouter : Router {
    
    weak var view: SettingsViewController?
    
    private let disposeBag = DisposeBag()
    
    let publishRouter = PublishSubject<Void>()
    
    static func assembleModule() -> SettingsRouter {
        let view = R.storyboard.settingsStoryboard.settingsViewController()!
        let presenter = SettingsPresenter(domain: "fernand0.atlassian.net")
        let router = SettingsRouter()
        view.presenter = presenter
        presenter.router = router
        router.view = view
        return router
    }
    
    func selectProject(callBack: @escaping (Result<JIRAProject>) -> Void) {
        let listProjectsRouter = ListProjectsRouter.assembleModule()
        executeInMainThread {
            view?.navigationController?.pushViewController(listProjectsRouter.view!, animated: true)
        }
        listProjectsRouter.publishRouter.subscribe { [weak self] (event) in
            switch event {
            case .next(let project):
                callBack(Result.success(result: project))
                break
            case .error(let error):
                callBack(Result.failure(error: error))
                break
            case .completed:
                self?.view?.navigationController?.popViewController(animated: true)
                break
            }
            }.disposed(by: disposeBag)
    }
    
}
