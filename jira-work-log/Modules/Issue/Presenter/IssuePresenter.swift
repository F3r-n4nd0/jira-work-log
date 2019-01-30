//
//  IssuePresenter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/29/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class IssuePresenter {
    
    var router: IssueRouter!
    var interactor: IssueInteractor!
    
    private let issue: JIRAIssue
    
    var publishIssue = PublishSubject<JIRAIssue>()
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    
    init(issue: JIRAIssue) {
        self.issue = issue
    }
    
    func loadData() {
        publishIssue.onNext(self.issue)
    }
    
    func addNewWorklog(comment: String,timeSeg: Double) {
        publishLoading.onNext(true)
        interactor.addWorkLog(issue: issue, comment: comment, timeSeg: timeSeg) { [weak self] (result) in
            self?.publishLoading.onNext(false)
            switch result {
            case .success():
                self?.router.close()
                break
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func close() {
        router.close()
    }
    
}
