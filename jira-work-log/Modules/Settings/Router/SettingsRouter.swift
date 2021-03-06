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
        let presenter = SettingsPresenter(settings: settings)
        let router = SettingsRouter()
        let interactor = SettingsInteractor()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func selectProject(callBack: @escaping (Result<JIRAProject>) -> Void) {
        let listProjectsRouter = ListProjectsRouter.assembleModule()
        executeInMainThread {
            self.view?.navigationController?.pushViewController(listProjectsRouter.view!, animated: true)
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
            self.view?.navigationController?.pushViewController(listVersionsRouter.view!, animated: true)
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
    
    func selectBoard(project: JIRAProject ,callBack: @escaping (Result<JIRABoard>) -> Void) {
        let listBoardRouter = ListBoardsRouter.assembleModule(project: project)
        executeInMainThread {
            self.view?.navigationController?.pushViewController(listBoardRouter.view!, animated: true)
        }
        listBoardRouter.publishRouter.subscribe { [weak self] (event) in
            switch event {
            case .next(let board):
                callBack(Result.success(result: board))
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
