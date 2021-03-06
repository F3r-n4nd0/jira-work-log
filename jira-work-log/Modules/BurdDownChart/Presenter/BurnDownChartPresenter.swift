//
//  BurnDownChartPresenter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/30/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class  BurnDownChartPresenter {
    
    var router: BurnDownChartRouter!
    var interactor: BurnDownChartInteractor!
    
    private var settings: Settings
    private var sprint: JIRASprint? {
        didSet {
            getDataChart()
        }
    }
    var dates: [Date] = []
    var data: JIRABurnDownChart?
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    var publishUpdateSprint = PublishSubject<Result<JIRASprint>>()
    
    init(settings: Settings) {
        self.settings = settings
    }
  
    func getDataChart() {
        guard let sprint = sprint else {
            return
        }
        publishLoading.onNext(true)
        interactor.GetData(sprint: sprint) { [weak self] (result) in
            self?.publishLoading.onNext(false)
            switch result {
            case .success(let result):
                self?.loadData(result: result)
                break
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func loadData(result: JIRABurnDownChart) {
        
        var newDate = result.startTimeDate()
        var dates = [Date]()
        let finalDate = result.endTimeDate().addingTimeInterval(12 * 60 * 60)
        while newDate <= finalDate   {
            dates.append(newDate)
            newDate = newDate.addingTimeInterval(12 * 60 * 60)
        }
        self.dates = dates
        self.data = result
        guard let sprint = sprint else {
            return
        }
        self.publishUpdateSprint.onNext(Result.success(result: sprint))
    }
    
    func selectSprint() {
        guard let board = settings.board else {
            return
        }
        router.selectSprint(board: board) { [weak self] (result) in
            switch result {
            case .success(let sprint):
                self?.sprint = sprint
            case .failure(let error):
                self?.publishShowNotification.onNext(Result.failure(error: error))
            }
        }
    }
    
    func quantityIssuesActive(index: Int) -> Double {
        guard let data = data else {
            return 0
        }
        let date = data.startTimeDate().addingTimeInterval(TimeInterval(12*60*60*index))
        return data.getPoints(dateDay:date)
    }
    
    func close() {
        router.close()
    }
    
}
