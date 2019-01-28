//
//  ListVersionsPresenter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class ListVersionsPresenter {
    
    var router: ListVersionsRouter!
    var interactor: ListVersionsInteractor!
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    
    let projects = Variable<[JIRAVersion]>([])
    
    private var domain: String
    private var project: JIRAProject
    
    init(domain: String,project: JIRAProject) {
        self.domain = domain
        self.project = project
    }
    
    func getVersions() {
        publishLoading.onNext(true)
        interactor.getAllVersions(domain: domain, project: project ) { [weak self] (result) in
            self?.publishLoading.onNext(false)
            switch result {
            case .success(let result):
                self?.projects.value = result
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func selectIndexPath(index: IndexPath) {
        let version = projects.value[index.row]
        router.returnProject(version: version)
    }
    
    func cancel() {
        router.close()
    }

}
