//
//  LoginInteractor.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/26/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class LoginInteractor {
   
    
    func loginJira(domain: String, user: String, password: String, callBack: @escaping (Result<Bool>) -> Void) throws {
        let headers = [
            "Content-Type": "application/json",
            "cache-control": "no-cache",
        ]
        let parameters = [
            "username": user,
            "password": password
            ] as [String : Any]
        
        let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        let request = NSMutableURLRequest(url: NSURL(string: "https://\(domain)/rest/auth/1/session")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                callBack(Result.failure(error: error))
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                callBack(Result.success(result: true))
                return
            }
            callBack(Result.success(result: false))
        })
        dataTask.resume()
    }
    
}
