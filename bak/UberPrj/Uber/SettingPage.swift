//
//  SettingPage.swift
//  Uber
//
//  Created by hejinbo on 15/11/15.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class SettingPage: FxBasePage {

    @IBOutlet var userBackView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem("Close.png", selector: "doBack", isRight: false)
    
        var frame = userBackView!.frame
        frame.origin.y = 64
        userBackView?.frame = frame
        self.view.addSubview(userBackView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
