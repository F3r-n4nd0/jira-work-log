//
//  IssueRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/29/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class IssueRouter {
 
    weak var view: IssueViewController?
    
    let publishRouter = PublishSubject<Void>()
    
    private let disposeBag = DisposeBag()
    
    static func assembleModule(issue: JIRAIssue) -> IssueRouter {
        let view = R.storyboard.issueStoryboard.issueViewController()!
        let presenter = IssuePresenter(issue: issue)
        let interactor = IssueInteractor()
        let router = IssueRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
    
    func close() {
        publishRouter.onCompleted()
    }
    
}
