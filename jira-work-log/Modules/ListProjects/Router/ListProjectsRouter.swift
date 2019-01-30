//
//  ListProjectsRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class ListProjectsRouter : Router {
 
    weak var view: ListProjectsViewController?
    
    let publishRouter = PublishSubject<JIRAProject>()
    
    static func assembleModule() -> ListProjectsRouter {
        let view = R.storyboard.listProjectsStoryboard.listProjectsViewController()!
        let presenter = ListProjectsPresenter()
        let interactor = ListProjectsInteractor()
        let router = ListProjectsRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func returnProject(project: JIRAProject) {
        publishRouter.onNext(project)
        publishRouter.onCompleted()
    }
    
    func close() {
        publishRouter.onCompleted()
    }
    
}
