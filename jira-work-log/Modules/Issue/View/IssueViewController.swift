//
//  IssueViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/29/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import HGCircularSlider
import RxSwift

class IssueViewController: ViewController {

    internal var presenter: IssuePresenter!
    
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var imageViewType: UIImageView!
    @IBOutlet weak var labelEstimate: UILabel!
    @IBOutlet weak var labelSpent: UILabel!
    @IBOutlet weak var labelRemaining: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    @IBOutlet weak var textFieldComment: UITextField!
    
    @IBOutlet weak var rangeCircularSlider: RangeCircularSlider!
    
    private let disposeBag = DisposeBag()
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeCircularSlider.startThumbImage = R.image.start()
        rangeCircularSlider.endThumbImage = R.image.finish()
        let dayInSeconds = 24 * 60 * 60
        rangeCircularSlider.minimumValue = CGFloat(60)
        rangeCircularSlider.maximumValue = CGFloat(dayInSeconds)
        rangeCircularSlider.startPointValue = 1 * 60 * 60
        rangeCircularSlider.endPointValue = 8 * 60 * 60
        updateTexts(rangeCircularSlider)
        subscribeIssue()
        subscribeLoading()
        subscribeNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        presenter.loadData()
    }
    
    func subscribeIssue() {
        presenter.publishIssue.subscribe(onNext: { [weak self] (issue) in
            self?.load(issue: issue)
        }).disposed(by: disposeBag)
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
    
    
    func load(issue: JIRAIssue) {
        labelSummary.text = issue.fields.summary
        labelType.text = issue.fields.issuetype.name.rawValue
        imageViewType.image = issue.fields.issuetype.name.getIconImage()
        labelEstimate.text = "Estimate: \(issue.fields.timetracking.originalEstimate)"
        labelSpent.text = "Spent: \(issue.fields.timetracking.timeSpent ?? "0h")"
        labelRemaining.text = "Remaining: \(issue.fields.timetracking.remainingEstimate ?? "0h")"
    }
    
    @IBAction func updateTexts(_ sender: AnyObject) {
        adjustValue(value: &rangeCircularSlider.startPointValue)
        adjustValue(value: &rangeCircularSlider.endPointValue)
        let bedtime = TimeInterval(rangeCircularSlider.startPointValue)
        let wake = TimeInterval(rangeCircularSlider.endPointValue)
        let duration = wake - bedtime
        let durationDate = Date(timeIntervalSinceReferenceDate: duration)
        dateFormatter.dateFormat = "HH:mm"
        durationLabel.text = dateFormatter.string(from: durationDate)
    }

    func adjustValue(value: inout CGFloat) {
        let minutes = value / 60
        let adjustedMinutes =  ceil(minutes / 5.0) * 5
        value = adjustedMinutes * 60
    }
    
    @IBAction func touchInsideCLose(_ sender: UIButton) {
        presenter.close()
    }
    
    @IBAction func touchInsideAdd(_ sender: UIButton) {
        let comment = textFieldComment.text ?? ""
        let bedtime = TimeInterval(rangeCircularSlider.startPointValue)
        let wake = TimeInterval(rangeCircularSlider.endPointValue)
        let duration = wake - bedtime
        presenter.addNewWorklog(comment: comment, timeSeg: duration)
    }
    
}
