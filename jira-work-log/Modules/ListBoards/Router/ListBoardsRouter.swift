//
//  ListBoardsRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class ListBoardsRouter : Router {
 
    weak var view: ListBoardsViewController?
    
    let publishRouter = PublishSubject<JIRABoard>()
    
    static func assembleModule(project: JIRAProject) -> ListBoardsRouter {
        let view = R.storyboard.listBoardsStoryboard.listBoardsViewController()!
        let presenter = ListBoardsPresenter(project: project)
        let interactor = ListBoardsInteractor()
        let router = ListBoardsRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func returnSprint(board: JIRABoard) {
        publishRouter.onNext(board)
        publishRouter.onCompleted()
    }
    
    func close() {
        publishRouter.onCompleted()
    }
    
}
