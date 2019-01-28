//
//  ListProjectsViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListProjectsViewController: ViewController {

    internal var presenter: ListProjectsPresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(R.nib.projectTableViewCell)
        presenter.projects.asObservable().bind(to: tableView.rx.items(cellIdentifier: R.nib.projectTableViewCell.name  , cellType: ProjectTableViewCell.self)) { (row, element, cell) in
            cell.textLabel?.text = element.name
            }
            .disposed(by: disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.getProjects()
    }
    
    @IBAction func selectCancelButton(_ sender: UIBarButtonItem) {
        presenter.cancel()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
