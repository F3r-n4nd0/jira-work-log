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

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "MMM dd hh:mm"
        return dateFormatter
    }()
    
    internal var presenter: BurnDownChartPresenter!
    
    @IBOutlet weak var chartView: CombinedChartView!
    @IBOutlet weak var textFieldSprint: UITextField!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeLoading()
        subscribeNotification()
        presenter.getDataChart()
        
//        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        
        chartView.drawBarShadowEnabled = false
        chartView.highlightFullBarEnabled = false
        
        
        chartView.drawOrder = [DrawOrder.bar.rawValue,
                               DrawOrder.bubble.rawValue,
                               DrawOrder.candle.rawValue,
                               DrawOrder.line.rawValue,
                               DrawOrder.scatter.rawValue]
        
        let l = chartView.legend
        l.wordWrapEnabled = true
        l.horizontalAlignment = .center
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        //        chartView.legend = l
        
        let rightAxis = chartView.rightAxis
        rightAxis.axisMinimum = 0
        
        let leftAxis = chartView.leftAxis
        leftAxis.axisMinimum = 0
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bothSided
        xAxis.axisMinimum = 0
        xAxis.granularity = 1
        xAxis.valueFormatter = self
        subscribeLoading()
        subscribeNotification()
        subscribeUpdateChart()
    }
    
    func subscribeLoading() {
        presenter.publishLoading.subscribe(onNext: { [weak self] (result) in
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
    
    func subscribeUpdateChart() {
        presenter.publishUpdateSprint.subscribe(onNext: { [weak self] (result) in
            switch result {
            case .success(let sprint):
                self?.updateSprint(sprint: sprint)
                break
            case .failure(let error):
                self?.showErrorMessage(message: error.localizedDescription)
            }
        }).disposed(by: disposeBag)
    }
    
    func updateSprint(sprint: JIRASprint) {
        executeInMainThread {
            self.textFieldSprint.text = sprint.name
        }
        setChartData()
    }
    
    func setChartData() {
        let data = CombinedChartData()
        data.lineData = generateLineData()
        chartView.xAxis.axisMaximum = data.xMax
        executeInMainThread {
            self.chartView.data = data
        }
    }
    
    @IBAction func selectSprint(_ sender: UITapGestureRecognizer) {
        presenter.selectSprint()
    }
    
    func generateLineData() -> LineChartData {
        
        let count = presenter.dates.count
        
        let entries = (0..<count).map { (i) -> ChartDataEntry in
            return ChartDataEntry(x: Double(i), y: presenter.quantityIssuesActive(index: i))
        }
        
        let set = LineChartDataSet(values: entries, label: "Burndown chart")
        set.setColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
        set.lineWidth = 2.5
        set.setCircleColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
        set.circleRadius = 5
        set.circleHoleRadius = 2.5
        set.fillColor = UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1)
        set.mode = .cubicBezier
        set.drawValuesEnabled = true
        set.valueFont = .systemFont(ofSize: 10)
        set.valueTextColor = UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1)
        
        set.axisDependency = .left
        
        return LineChartData(dataSet: set)
    }
    
    @IBAction func touchUpInsideClose(_ sender: UIButton) {
        presenter.close()
    }
    
    
}

extension BurnDownChartViewController: IAxisValueFormatter {

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let date = presenter.dates[Int(value) % presenter.dates.count]
        return dateFormatter.string(from: date)
    }
    
}
