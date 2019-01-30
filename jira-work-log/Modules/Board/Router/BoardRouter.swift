//
//  BoardRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class BoardRouter: Router {
    
    weak var view: BoardViewController?
    
    let publishRouter = PublishSubject<Void>()
    
    private let disposeBag = DisposeBag()
    
    static func assembleModule(settings: Settings) -> BoardRouter {
        let view = R.storyboard.boardStoryboard.boardViewController()!
        let presenter = BoardPresenter(settings: settings)
        let interactor = BoardInteractor()
        let router = BoardRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func close() {
        publishRouter.onCompleted()
    }
    
    func showSettigs(settings: Settings, callBack: @escaping (Result<Settings>) -> Void) {
        let settingsRouter = SettingsRouter.assembleModule(settings: settings)
        executeInMainThread {
            self.view?.navigationController?.pushViewController(settingsRouter.view!, animated: true)
        }
        settingsRouter.publishRouter.subscribe { [weak self] (event) in
            switch event {
            case .next(let setting):
                callBack(Result.success(result: setting))
                break
            case .error(let error):
                callBack(Result.failure(error: error))
                break
            case .completed:
                self?.executeInMainThread {
                    self?.view?.navigationController?.popViewController(animated: true)
                }
                break
            }
            }.disposed(by: disposeBag)
    }
    
    func showIssue(issue: JIRAIssue, callBack: @escaping (Result<Void>) -> Void) {
        let issueRouter = IssueRouter.assembleModule(issue: issue)
        executeInMainThread {
            self.view?.navigationController?.pushViewController(issueRouter.view!, animated: true)
        }
        issueRouter.publishRouter.subscribe { [weak self] (event) in
            switch event {
            case .next(let setting):
                callBack(Result.success(result: setting))
                break
            case .error(let error):
                callBack(Result.failure(error: error))
                break
            case .completed:
                self?.executeInMainThread {
                    self?.view?.navigationController?.popViewController(animated: true)
                }
                break
            }
            }.disposed(by: disposeBag)
    }
    
    func showBurnDownChart(settings: Settings, callBack: @escaping (SimpleResult) -> Void) {
        let burnDownCharRouter = BurnDownChartRouter.assembleModule(settings: settings)
        executeInMainThread {
            self.view?.navigationController?.pushViewController(burnDownCharRouter.view!, animated: true)
        }
        burnDownCharRouter.publishRouter.subscribe { [weak self] (event) in
            switch event {
            case .next(_):
                callBack(SimpleResult.success())
                break
            case .error(let error):
                callBack(SimpleResult.failure(error: error))
                break
            case .completed:
                self?.executeInMainThread {
                    self?.view?.navigationController?.popViewController(animated: true)
                }
                break
            }
            }.disposed(by: disposeBag)
    }
    
}
