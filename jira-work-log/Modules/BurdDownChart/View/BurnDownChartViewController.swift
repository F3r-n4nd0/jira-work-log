//
//  BurnDownChartViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/30/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import Charts
import RxSwift

class BurnDownChartViewController: ViewController {

    internal var presenter: BurnDownChartPresenter!
    
    @IBOutlet weak var chartView: CombinedChartView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeLoading()
        subscribeNotification()
        presenter.getDataChart()
    }

    func subscribeLoading() {
        presenter.publishLoading.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (result) in
                if result {
                    self?.startWaitAnimation()
                } else {
                    self?.stopAnimating()
                }
            }).disposed(by: disposeBag)
    }
    
    func subscribeNotification() {
        presenter.publishShowNotification.subscribe(onNext: { [weak self] (result) in
            switch result {
            case .success(let message):
                self?.showInfoMessage(message: message)
            case .failure(let error):
                self?.showErrorMessage(message: error.localizedDescription)
            }
        }).disposed(by: disposeBag)
    }

}
