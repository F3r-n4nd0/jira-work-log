//
//  SettingsInteractor.swift
//  jira-work-log
//
//  Created by Fernando Luna on 1/29/19.
//  Copyright © 2019 Fernando Luna. All rights reserved.
//

import Foundation

class SettingsInteractor {
    
    func saveSettings(setting: Settings) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(try? PropertyListEncoder().encode(setting), forKey:Settings.name)
        userDefaults.synchronize()
    }
    
}
