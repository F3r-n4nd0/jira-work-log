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
    var interactor: SettingsInteractor!
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    let settings: Variable<Settings>
        
    init(settings: Settings) {
        self.settings = Variable<Settings>(settings)
    }
    
    func selectProject() {
        router.selectProject { [weak self] (result) in
            switch result {
            case .success(let project):
                if self?.settings.value.project?.id != project.id {
                    self?.settings.value.project = project
                    self?.settings.value.version = nil
                    self?.settings.value.sprint = nil
                }
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
        router.selectSprint(project: project) { [weak self] (result) in
            switch result {
            case .success(let sprint):
                self?.settings.value.sprint = sprint
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func selectDone() {
        interactor.saveSettings(setting: settings.value)
        router.selectDone(settings: settings.value)
    }
    
}
