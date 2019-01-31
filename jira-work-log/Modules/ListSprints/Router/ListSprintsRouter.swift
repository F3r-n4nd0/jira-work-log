//
//  ListVersionsRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class ListSprintsRouter : Router {
 
    weak var view: ListSprintsViewController?
    
    let publishRouter = PublishSubject<JIRASprint>()
    
    static func assembleModule(board: JIRABoard) -> ListSprintsRouter {
        let view = R.storyboard.listSprintsStoryboard.listSprintsViewController()!
        let presenter = ListSprintsPresenter(board: board)
        let interactor = ListSprintsInteractor()
        let router = ListSprintsRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func returnSprint(sprint: JIRASprint) {
        publishRouter.onNext(sprint)
        publishRouter.onCompleted()
    }
    
    func close() {
        publishRouter.onCompleted()
    }
    
}
