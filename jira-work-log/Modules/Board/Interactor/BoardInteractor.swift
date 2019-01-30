//
//  BoardInteractor.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class BoardInteractor {
    
    func getAllIssues(settings: Settings,  callBack: @escaping (Result<[JIRAIssue]>) -> Void) {
        let path = "/rest/agile/1.0/board/\(settings.board?.id ?? 0)/issue?boardId=\(settings.board?.id ?? 0)"
        let request = HTTPConnection.shared.createGetRequest(path: path)!
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void  in
            if let error = error {
                callBack(Result.failure(error: error))
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                let error = NSError(domain:"Error service", code:httpStatus.statusCode, userInfo:nil)
                callBack(Result.failure(error: error))
                return
            }
            do {
                let response = try JSONDecoder().decode(JIRAResponseIssuesBoard.self, from: data!)
                callBack(Result.success(result: response.issues))
                return
            } catch let error {
                callBack(Result.failure(error: error))
                return
            }
        })
        dataTask.resume()
    }
    
    func removeSettingsAndCredentials() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: Settings.name)
        userDefaults.removeObject(forKey: Credentials.name)
        userDefaults.synchronize()
    }
    
}
