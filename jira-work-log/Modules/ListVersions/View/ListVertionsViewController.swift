//
//  ListVertionsViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListVertionsViewController: ViewController {

    internal var presenter: ListVersionsPresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(R.nib.versionTableViewCell)
        subscribeTable()
        subscribeLoading()
        subscribeNotification()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.getVersions()
    }
    
    func subscribeTable() {
        presenter.versions.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: R.nib.versionTableViewCell.name, cellType: VersionTableViewCell.self)) { (row, element, cell) in
            cell.textLabel?.text = element.name
            }
            .disposed(by: disposeBag)
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.presenter.selectIndexPath(index: indexPath)
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
    
    @IBAction func selectCancelButton(_ sender: UIBarButtonItem) {
        presenter.cancel()
    }
    
}
