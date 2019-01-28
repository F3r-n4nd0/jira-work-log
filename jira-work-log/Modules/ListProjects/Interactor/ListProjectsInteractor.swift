//
//  ListProjectsInteractor.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class ListProjectsInteractor {
    
    func getAllProjects(domain: String, callBack: @escaping (Result<[JIRAProject]>) -> Void) {
        let headers = [
            "cache-control": "no-cache",
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://\(domain)/rest/api/2/project")! as URL,
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
                let projects = try JSONDecoder().decode([JIRAProject].self, from: data!)
                callBack(Result.success(result: projects))
                return
            } catch let error {
                callBack(Result.failure(error: error))
                return
            }
        })
        
        dataTask.resume()
    }
}
