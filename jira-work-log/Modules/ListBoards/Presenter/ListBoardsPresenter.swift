//
//  ListBoardsPresenter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class ListBoardsPresenter {
    
    var router: ListSprintsRouter!
    var interactor: ListBoardsInteractor!
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    
    let sprints = Variable<[JIRABoard]>([])
    
    private var project: JIRAProject
    
    init(project: JIRAProject) {
        self.project = project
    }
    
    func getSprints() {
        publishLoading.onNext(true)
        interactor.getAllBoards(project: project ) { [weak self] (result) in
            self?.publishLoading.onNext(false)
            switch result {
            case .success(let result):
                self?.sprints.value = result
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func selectIndexPath(index: IndexPath) {
        let sprint = sprints.value[index.row]
        router.returnSprint(board: sprint)
    }
    
    func cancel() {
        router.close()
    }

}
