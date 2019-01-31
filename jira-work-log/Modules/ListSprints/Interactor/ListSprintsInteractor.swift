//
//  ListVersionsInteractor.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/27/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class ListSprintsInteractor {
    
    func getAllSprints(board: JIRABoard,  callBack: @escaping (Result<[JIRASprint]>) -> Void) {
        let path = "/rest/agile/1.0/board/\(board.id)/sprint"
        let request = HTTPConnection.shared.createGetRequest(path:path)!
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
                let response = try JSONDecoder().decode(JIRAResponseSprint.self, from: data!)
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
