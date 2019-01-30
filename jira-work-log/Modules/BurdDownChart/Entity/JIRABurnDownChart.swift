//
//  JIRABurnDownChart.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/30/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

struct JIRABurnDownChart: Codable {
    let changes: [String: [Change]]
    let startTime, endTime, now: Int
    let statisticField: StatisticField
    let issueToSummary: [String: String]
    let workRateData: WorkRateData
    
    func startTimeDate() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(startTime))
    }
    
    func endTimeDate() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(endTime))
    }
    
    func nowDate() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(now))
    }
}

struct Change: Codable {
    let key: String
    let column: Column?
    let added: Bool?
    let statC: StatC?
}

struct Column: Codable {
    let notDone: Bool
    let newStatus: String
    let done: Bool?
}

struct StatC: Codable {
    let newValue: Int
}

struct StatisticField: Codable {
    let typeID, fieldID, id, name: String
    let isValid, isEnabled: Bool
    let renderer: String
    
    enum CodingKeys: String, CodingKey {
        case typeID = "typeId"
        case fieldID = "fieldId"
        case id, name, isValid, isEnabled, renderer
    }
}

struct WorkRateData: Codable {
    let timezone: String
    let rates: [Rate]
}

struct Rate: Codable {
    let start, end, rate: Int
}
