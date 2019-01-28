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
    
    let publishRouter = PublishSubject<Settings>()
    
    static func assembleModule(settings: Settings) -> SettingsRouter {
        let view = R.storyboard.settingsStoryboard.settingsViewController()!
        let presenter = SettingsPresenter(domain: "fernand0.atlassian.net",settings: settings)
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
    
    func selectVersion(project: JIRAProject ,callBack: @escaping (Result<JIRAVersion>) -> Void) {
        let listVersionsRouter = ListVersionsRouter.assembleModule(project: project)
        executeInMainThread {
            view?.navigationController?.pushViewController(listVersionsRouter.view!, animated: true)
        }
        listVersionsRouter.publishRouter.subscribe { [weak self] (event) in
            switch event {
            case .next(let version):
                callBack(Result.success(result: version))
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
    
    func selectSprint(project: JIRAProject ,callBack: @escaping (Result<JIRASprint>) -> Void) {
        let listSprintRouter = ListSprintsRouter.assembleModule(project: project)
        executeInMainThread {
            view?.navigationController?.pushViewController(listSprintRouter.view!, animated: true)
        }
        listSprintRouter.publishRouter.subscribe { [weak self] (event) in
            switch event {
            case .next(let sprint):
                callBack(Result.success(result: sprint))
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
    
    func selectDone(settings: Settings) {
        publishRouter.onNext(settings)
        publishRouter.onCompleted()
    }
    
}
