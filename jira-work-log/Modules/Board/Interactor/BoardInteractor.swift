//
//  BoardInteractor.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/28/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class BoardInteractor {
    
    func getAllIssues(domain: String, settings: Settings,  callBack: @escaping (Result<[JIRAIssue]>) -> Void) {
        let headers = [
            "cache-control": "no-cache",
            ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://\(domain)/rest/agile/1.0/board/\(settings.sprint?.id ?? 0)/issue?boardId=\(settings.sprint?.id ?? 0)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void  in
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
    
}
