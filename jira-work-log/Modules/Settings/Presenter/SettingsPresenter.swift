//
//  SettingsPresenter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class SettingsPresenter {
    
    var router: SettingsRouter!
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    let settings = Variable<Settings>(Settings())
    
    private let domain: String
        
    init(domain: String) {
        self.domain = domain
    }
    
    func selectProject() {
        router.selectProject { [weak self] (result) in
            switch result {
            case .success(let project):
                self?.settings.value.project = project
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func selectVersion() {
        guard let project = settings.value.project else {
            return
        }
        router.selectVersion(project: project) { [weak self] (result) in
            switch result {
            case .success(let version):
                self?.settings.value.version = version
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func selectSprint() {
        guard let project = settings.value.project else {
            return
        }
        router.selectVersion(project: project) { [weak self] (result) in
            switch result {
            case .success(let version):
                self?.settings.value.version = version
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
}
