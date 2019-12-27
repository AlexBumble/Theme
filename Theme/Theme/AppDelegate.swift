//
//  AppDelegate.swift
//  Theme
//
//  Created by Алексей Бузов on 27.12.2019.
//  Copyright © 2019 Alexey Buzov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SceneViewController()
        window?.makeKeyAndVisible()
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        Theme.setTheme(interfaceStyle: window?.traitCollection.userInterfaceStyle)
    }
}

