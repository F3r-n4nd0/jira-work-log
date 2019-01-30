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
    
    private var settings:Settings
    
    var publishLoading = PublishSubject<Bool>()
    var publishShowNotification = PublishSubject<Result<String>>()
    
    init(settings: Settings) {
        self.settings = settings
    }
  
    func getDataChart() {
        publishLoading.onNext(true)
        interactor.GetData(board: settings.board!) { [weak self] (result) in
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
        while newDate > result.endTimeDate()   {
            dates.append(newDate)
            newDate = newDate.addingTimeInterval(12 * 60 * 60)
        }
        print(dates)
        
        
    }
    
}
