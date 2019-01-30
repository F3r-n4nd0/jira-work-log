//
//  BurnDownChartRouter.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/30/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation
import RxSwift

class BurnDownChartRouter {
    
    weak var view: BurnDownChartViewController?
    
    let publishRouter = PublishSubject<Void>()
    
    static func assembleModule(settings: Settings) -> BurnDownChartRouter {
        let view = R.storyboard.burnDownChartStoryboard.burnDownChartViewController()!
        let presenter = BurnDownChartPresenter(settings: settings)
        let interactor = BurnDownChartInteractor()
        let router = BurnDownChartRouter()
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        router.view = view
        return router
    }
}
