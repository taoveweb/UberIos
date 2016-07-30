
//
//  FxBasePage.swift
//  Uber
//
//  Created by hejinbo on 15/10/9.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class FxBasePage: FxBaseController {

    @IBOutlet var backView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setNavigationItem(title:String,
        selector:Selector, isRight:Bool)
    {
        var item:UIBarButtonItem!
        
        if title.hasSuffix("png") {
            item = UIBarButtonItem(image: UIImage(named: title), style: .Plain, target: self, action: selector)
        }
        else {
            item = UIBarButtonItem(title: title, style: .Plain, target: self, action: selector)
        }
        
        item.tintColor = UIColor.darkGrayColor()
        
        if isRight {
            self.navigationItem.rightBarButtonItem = item
        }
        else {
            self.navigationItem.leftBarButtonItem = item
        }
    }
    
    func doRight()
    {
    
    }
    
    func doBack()
    {
        if self.navigationController?.viewControllers.count > 1 {
            self.navigationController?.popViewControllerAnimated(true)
        }
        else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
