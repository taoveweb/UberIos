//
//  CreateAccountPage.swift
//  Uber
//
//  Created by hejinbo on 15/10/22.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class CreateAccountPage: FxBasePage {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "创建账户"
        
        setNavigationItem("下一步", selector: "doRight", isRight: true)
        setNavigationItem("取消", selector: "doBack", isRight: false)
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
    }
    
    override func doRight()
    {
        let page = UserInfoPage()
        
        self.navigationController?.pushViewController(page, animated: true)
    }
    
    @IBAction func doSelctCountry(sender:UIButton)
    {
        let page = SelectCountryPage()
        let NavPage = UINavigationController(rootViewController: page)
        
        self.presentViewController(NavPage, animated: true, completion: nil)
    }
}
