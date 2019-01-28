//
//  ListVersionsRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class ListVersionsRouter : Router {
 
    weak var view: ListVertionsViewController?
    
    let publishRouter = PublishSubject<JIRAVersion>()
    
    static func assembleModule(project: JIRAProject) -> ListVersionsRouter {
        let view = R.storyboard.listVertionsStoryboard.listVertionsViewController()!
        let presenter = ListVersionsPresenter(domain: "fernand0.atlassian.net", project: project)
        let interactor = ListVersionsInteractor()
        let router = ListVersionsRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func returnVersion(version: JIRAVersion) {
        publishRouter.onNext(version)
        publishRouter.onCompleted()
    }
    
    func close() {
        publishRouter.onCompleted()
    }
    
}
