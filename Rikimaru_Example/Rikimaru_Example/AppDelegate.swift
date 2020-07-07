//
//  AppDelegate.swift
//  Rikimaru_Example
//
//  Created by stefanie on 2020/7/6.
//  Copyright © 2020 stefanie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = TableViewController()
    window.makeKeyAndVisible()
    self.window = window
    return true
  }

}

