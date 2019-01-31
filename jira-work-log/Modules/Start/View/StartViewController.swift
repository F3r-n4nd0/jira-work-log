//
//  StartViewController.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/26/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import UIKit
import RxSwift

class StartViewController: UINavigationController {

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginRoute = LoginRouter.assembleModule()
        addChild(loginRoute.view!)
        if getCredentials() {
            let router = BoardRouter.assembleModule(settings: GetSettings() ?? Settings())
            self.addChild(router.view!)
            router.publishRouter.subscribe { [weak self] (event) in
                switch event {
                case .next(_):
                    break
                case .error(_):
                    break
                case .completed:
                    self?.popViewController(animated: true)
                    break
                }
                }.disposed(by: disposeBag)
        }
    }
    
    func getCredentials() -> Bool {
        if let data = UserDefaults.standard.value(forKey:Credentials.name) as? Data {
            let credential = try? PropertyListDecoder().decode(Credentials.self, from: data)
            HTTPConnection.shared.credentials = credential
        }
        return (HTTPConnection.shared.credentials != nil)
    }
    
    func GetSettings() -> Settings? {
        if let data = UserDefaults.standard.value(forKey:Settings.name) as? Data {
            return try? PropertyListDecoder().decode(Settings.self, from: data)
        }
        return nil
    }
}
