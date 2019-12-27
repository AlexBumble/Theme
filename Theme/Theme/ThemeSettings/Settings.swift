//
//  Settings.swift
//  Theme
//
//  Created by Алексей Бузов on 27.12.2019.
//  Copyright © 2019 Alexey Buzov. All rights reserved.
//

import UIKit

protocol ThemeSettingsProperties {
    static var themeSetting: ThemeSetting { get set }
}

enum ThemeSetting {
    case userChoise
    case auto
}

/// This struct have user defaults settings such as Theme, Language and etc
struct Settings: ThemeSettingsProperties {
    static var _themeSetting: ThemeSetting = .auto
    static var themeSetting: ThemeSetting {
        get {
            return _themeSetting
        }
        set {
            if newValue != _themeSetting {
                UserDefaults.standard.set(newValue == .auto, forKey: "ThemeSettings")
                _themeSetting = newValue
            }
        }
    }
}

