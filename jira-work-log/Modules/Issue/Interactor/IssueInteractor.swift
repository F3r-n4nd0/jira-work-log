//
//  IssueInteractor.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/29/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class IssueInteractor {
    
    func addWorkLog(issue: JIRAIssue,comment: String, timeSeg: Double, callBack: @escaping (SimpleResult) -> Void) {
        
        let parameters = [
            "comment": [
                "type": "doc",
                "version": 1,
                "content": [
                    [
                        "type": "paragraph",
                        "content": [
                            [
                                "type": "text",
                                "text": comment
                            ]
                        ]
                    ]
                ]
            ],
            "timeSpentSeconds": Int(timeSeg)
            ] as [String : Any]
        
        let path = "/rest/api/3/issue/\(issue.id)/worklog"
        var request = HTTPConnection.shared.createPostRequest(path: path)!
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch let error {
            callBack(SimpleResult.failure(error: error))
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void  in
            if let error = error {
                callBack(SimpleResult.failure(error: error))
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 201 {
                callBack(SimpleResult.success())
                return
            }
            let error = NSError(domain:"Error service", code:0, userInfo:nil)
            callBack(SimpleResult.failure(error: error))
        })
        dataTask.resume()
        
    }
    
}
