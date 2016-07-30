//
//  UserCenterPage.swift
//  Uber
//
//  Created by hejinbo on 15/11/15.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class UserCenterPage: FxBasePage {

    var owner:FxBasePage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doSetting() {
        let own = self.owner as! HomePage
        
        own.doShowSetting()
    }
}
