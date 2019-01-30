//
//  HTTPConnection.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/30/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class HTTPConnection {
    
    static let shared = HTTPConnection()

    var credentials: Credentials? = nil
    
    func createGetRequest(path: String) -> URLRequest? {
        guard let credentials = credentials else { return nil }
        let loginString = "\(credentials.user):\(credentials.password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            return nil
        }
        let base64LoginString = loginData.base64EncodedString()
        let headers = [
            "Content-Type": "application/json",
            "cache-control": "no-cache",
            "Authorization": "Basic \(base64LoginString)"
        ]
        let url = URL(string: "https://\(credentials.domain)\(path)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
    
    func createPostRequest(path: String) -> URLRequest? {
        guard let credentials = credentials else { return nil }
        let loginString = "\(credentials.user):\(credentials.password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            return nil
        }
        let base64LoginString = loginData.base64EncodedString()
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Basic \(base64LoginString)"
        ]
        let url = URL(string: "https://\(credentials.domain)\(path)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        return request
    }
    
}
