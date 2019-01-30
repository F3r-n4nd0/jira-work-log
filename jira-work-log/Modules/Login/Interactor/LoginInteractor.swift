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
        HTTPConnection.shared.credentials = Credentials(user: user, password: password, domain: domain)
        let request = HTTPConnection.shared.createGetRequest(path: "/rest/auth/1/session/")!
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                callBack(Result.failure(error: error))
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                callBack(Result.success(result: true))
                return
            }
            callBack(Result.success(result: false))
        }
        dataTask.resume()
    }
    
    func GetSettings() -> Settings? {
        if let data = UserDefaults.standard.value(forKey:Settings.name) as? Data {
            return try? PropertyListDecoder().decode(Settings.self, from: data)
        }
        return nil
    }
    
    func storeCredentials() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(try? PropertyListEncoder().encode(HTTPConnection.shared.credentials), forKey:Credentials.name)
        userDefaults.synchronize()
    }
    
}
