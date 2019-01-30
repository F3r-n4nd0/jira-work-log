//
//  BurnDownChartInteractor.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/30/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class BurnDownChartInteractor {
    
    func GetData(board: JIRABoard, callBack: @escaping (Result<JIRABurnDownChart>) -> Void) {
        let path = "/rest/greenhopper/1.0/rapid/charts/scopechangeburndownchart.json?rapidViewId=8&sprintId=\(board.id)"
        let request = HTTPConnection.shared.createGetRequest(path: path)!
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
                let response = try JSONDecoder().decode(JIRABurnDownChart.self, from: data!)
                callBack(Result.success(result: response))
                return
            } catch let error {
                callBack(Result.failure(error: error))
                return
            }
        })
        
        dataTask.resume()
    }
    
    func GetData2(board: JIRABoard, callBack: @escaping (Result<JIRABurnDownChart>) -> Void) {
        let path = "/rest/agile/1.0/board/\(board.id)/sprint"
        let request = HTTPConnection.shared.createGetRequest(path: path)!
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
                let response = try JSONDecoder().decode(JIRABurnDownChart.self, from: data!)
                callBack(Result.success(result: response))
                return
            } catch let error {
                callBack(Result.failure(error: error))
                return
            }
        })
        
        dataTask.resume()
    }
    
    
}
