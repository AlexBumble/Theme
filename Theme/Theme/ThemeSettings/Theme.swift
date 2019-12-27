//
//  Theme.swift
//  Theme
//
//  Created by Алексей Бузов on 27.12.2019.
//  Copyright © 2019 Alexey Buzov. All rights reserved.
//

import UIKit


// MARK: ViewTheme

/// Methods for fast set theme on view
protocol ViewTheme {
    func setViewTheme(with components: ThemeComponents)
}


// MARK: Theme Components
struct ThemeComponents {
    var backGroundColor: UIColor
    var textColor: UIColor
    var buttonColor: UIColor
    var lableBackGroundColor: UIColor
}


// MARK: Theme
enum Theme {

    case light
    case dark

    private static var _current: Theme = {
        switch UserDefaults.standard.bool(forKey: "ThemeDefault") {
        case true: return .dark
        case false: return .light
        }
    }()


    static var current: Theme {
        get {
            return _current
        }
        set {
            if _current != newValue {
                _current = newValue
                NotificationCenter.default.post(name: .themeChange, object: nil)
                UserDefaults.standard.set(newValue == .dark, forKey: "ThemeDefault")
            }
        }
    }

    static var backGroundColor: UIColor {
        switch current {
        case .light: return .white
        case .dark: return .black
        }
    }

    static var fontColor: UIColor {
        switch current {
        case .light: return .black
        case .dark: return .white
        }
    }

    static var buttonColor: UIColor {
        switch current {
        case .light: return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case .dark: return #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        }
    }

    static var lableBackGroundColor: UIColor {
        switch current {
        case .light: return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        case .dark: return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }

    static var components: ThemeComponents {
        let components = ThemeComponents(backGroundColor: backGroundColor,
                                         textColor: fontColor,
                                         buttonColor: buttonColor,
                                         lableBackGroundColor: lableBackGroundColor)
        return components
    }

    /// Set app theme on all view's
    static func setTheme(interfaceStyle: UIUserInterfaceStyle?) {
        if Settings.themeSetting == .auto {
            switch interfaceStyle {
            case .light, .unspecified: Theme.current = .light
            default: Theme.current = .dark
            }
        }
    }
}

@objc protocol ThemeDidChangeDelegate {
    @objc func themeDidChange()
}

extension UIView: ThemeDidChangeDelegate {
    func themeDidChange() {}
}

extension UIViewController: ThemeDidChangeDelegate {
    func themeDidChange() {}
}

extension ThemeDidChangeDelegate {
    func addThemeChangeObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(themeDidChange),
            name: .themeChange,
            object: nil)
    }

    func removeThemeChangeObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: .themeChange,
            object: nil)
    }
}

extension NSNotification.Name {
    static var themeChange: NSNotification.Name {
        return .init("ThemeChange")
    }
}
