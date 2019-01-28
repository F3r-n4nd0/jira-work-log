//
//  BoardViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SideMenu

class BoardViewController: ViewController {

    internal var presenter: BoardPresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(R.nib.issueTableViewCell)
        subscribeTable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.getIssues()
    }
    
    func subscribeTable() {
        presenter.issues.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: R.nib.issueTableViewCell.name, cellType: IssueTableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = element.fields.summary
            }
            .disposed(by: disposeBag)
//        tableView.rx.itemSelected
//            .subscribe(onNext: { [weak self] indexPath in
//                self?.presenter.selectIndexPath(index: indexPath)
//            }).disposed(by: disposeBag)
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
    
    
    func selectSettings() {
        dismiss(animated: true) { [weak self] in
            self?.presenter.showSettings()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is UISideMenuNavigationController
        {
            let nav = segue.destination as? UISideMenuNavigationController
            let vc = nav?.visibleViewController as? MenuViewController
            vc?.boardViewController = self
        }
        
    }

}
