//
//  BurnDownChartRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/30/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class BurnDownChartRouter : Router {
    
    weak var view: BurnDownChartViewController?
    
    let publishRouter = PublishSubject<Void>()
    
    private let disposeBag = DisposeBag()
    
    static func assembleModule(settings: Settings) -> BurnDownChartRouter {
        let view = R.storyboard.burnDownChartStoryboard.burnDownChartViewController()!
        let presenter = BurnDownChartPresenter(settings: settings)
        let interactor = BurnDownChartInteractor()
        let router = BurnDownChartRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func selectSprint(board: JIRABoard ,callBack: @escaping (Result<JIRASprint>) -> Void) {
        let listSprintRouter = ListSprintsRouter.assembleModule(board: board)
        executeInMainThread {
            self.view?.navigationController?.pushViewController(listSprintRouter.view!, animated: true)
        }
        listSprintRouter.publishRouter.subscribe { [weak self] (event) in
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
    
}
