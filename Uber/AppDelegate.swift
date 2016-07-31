//
//  AppDelegate.swift
//  Uber
//
//  Created by 黄 家金 on 16/7/30.
//  Copyright © 2016年 黄 家金. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        showGuidePage()
         return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }
    
    func showGuidePage() {
        let page = GuidePage()
        self.window?.rootViewController = page
        self.window?.makeKeyAndVisible()
        
    }


}

