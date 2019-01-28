//
//  ListProjectsPresenter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class ListProjectsPresenter {
    
    var router: ListProjectsRouter!
    var interactor: ListProjectsInteractor!
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    
    let projects = Variable<[JIRAProject]>([])
    
    private var domain: String
    
    init(domain: String) {
        self.domain = domain
    }
    
    func getProjects() {
        interactor.getAllProjects(domain: domain ) { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.projects.value = result
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func cancel() {
        router.close()
    }

}
