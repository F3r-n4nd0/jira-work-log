//
//  ListSprintsRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class ListSprintsRouter : Router {
 
    weak var view: ListBoardsViewController?
    
    let publishRouter = PublishSubject<JIRABoard>()
    
    static func assembleModule(project: JIRAProject) -> ListSprintsRouter {
        let view = R.storyboard.listBoardsStoryboard.listBoardsViewController()!
        let presenter = ListBoardsPresenter(project: project)
        let interactor = ListBoardsInteractor()
        let router = ListSprintsRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func returnSprint(board: JIRABoard) {
        publishRouter.onNext(sprint)
        publishRouter.onCompleted()
    }
    
    func close() {
        publishRouter.onCompleted()
    }
    
}
