//
//  BoardPresenter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class BoardPresenter {
    
    var router: BoardRouter!
    var interactor: BoardInteractor!
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    
    let issues = Variable<[JIRAIssue]>([])
    
    private var domain: String
    private var settings: Settings
    
    init(domain: String,settings: Settings) {
        self.domain = domain
        self.settings = settings
    }
    
    func getIssues() {
        publishLoading.onNext(true)
        interactor.getAllIssues(domain: domain, settings: settings) { [weak self] (result) in
            self?.publishLoading.onNext(false)
            switch result {
            case .success(let result):
                self?.issues.value = result
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func showSettings() {
        router.showSettigs(settings: settings) { (result) in
            switch result {
            case .success(let result):
                self.settings = result
                self.getIssues()
            case .failure(let error):
                self.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func selectIndexPath(index: IndexPath) {
        let issue = issues.value[index.row]
        
    }
    
}
