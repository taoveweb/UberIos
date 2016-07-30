//
//  AppDelegate.swift
//  Uber
//
//  Created by hejinbo on 15/10/9.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mapManager:BMKMapManager?
    var mPush:FxPush?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        mPush = MiPush()

        if isiPhone5() {
            FxLog("StartUp:iPhone5")
        }
        
        showGuidePage()
        addMap()
        
        return true
    }
    
    func addMap()
    {
        mapManager = BMKMapManager()
        let ret:Bool = mapManager!.start("SaP49zgmBpM5aVBp97nr5mWz", generalDelegate: nil)
        
        if !ret {
            print("fail")
        }
    }
    
    func showGuidePage()
    {
        let page = GuidePage()
        
        self.window?.rootViewController = page
        self.window?.makeKeyAndVisible()
    }
    
    func showHomePage()
    {
        let page = HomePage()
        let navPage = UINavigationController(rootViewController: page)
        
        self.window?.rootViewController = navPage
        self.window?.makeKeyAndVisible()
    }

    func applicationWillResignActive(application: UIApplication)
    {
    }

    func applicationDidEnterBackground(application: UIApplication)
    {
    }

    func applicationWillEnterForeground(application: UIApplication)
    {
    }

    func applicationDidBecomeActive(application: UIApplication)
    {
    }

    func applicationWillTerminate(application: UIApplication)
    {
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        showNotification(userInfo)
        updateNotification(application)
        mPush?.handleNotification(userInfo)
    }
    
    func showNotification(info:[NSObject:AnyObject])
    {
        print(info["aps"]?.objectForKey("alert"))
    }
    
    func updateNotification(app:UIApplication)
    {
        app.cancelAllLocalNotifications()
        app.applicationIconBadgeNumber = 0
    }
}

