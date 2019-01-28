//
//  ListVersionsInteractor.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class ListSprintsInteractor {
    
    func getAllSprints(domain: String, project: JIRAProject,  callBack: @escaping (Result<[JIRASprint]>) -> Void) {
        let headers = [
            "cache-control": "no-cache",
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://\(domain)/rest/agile/1.0/board?projectKeyOrId=\(project.id ?? "")&type=scrum")! as URL,
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
                let response = try JSONDecoder().decode(JIRAResponseBoard.self, from: data!)
                callBack(Result.success(result: response.values))
                return
            } catch let error {
                callBack(Result.failure(error: error))
                return
            }
        })
        
        dataTask.resume()
    }
}
