//
//  ListSprintsPresenter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class ListSprintsPresenter {
    
    var router: ListSprintsRouter!
    var interactor: ListSprintsInteractor!
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    
    let sprints = Variable<[JIRASprint]>([])
    
    private var board: JIRABoard
    
    init(board: JIRABoard) {
        self.board = board
    }
    
    func getSprints() {
        publishLoading.onNext(true)
        interactor.getAllSprints(board: board ) { [weak self] (result) in
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
        router.returnSprint(sprint: sprint)
    }
    
    func cancel() {
        router.close()
    }

}
