//
//  VerifyPhonePage.swift
//  Uber
//
//  Created by hejinbo on 15/10/15.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class VerifyPhonePage: FxBasePage {

    @IBOutlet var number1:UITextField!
    @IBOutlet var number2:UITextField!
    @IBOutlet var number3:UITextField!
    @IBOutlet var number4:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "确认手机"
        setNavigationItem("Close.png", selector: "doBack", isRight: false)
    }
    
    @IBAction func doValueChanged(textField: UITextField)
    {
        let tag = textField.tag
        
        if textField.text!.isEmpty {
            if tag-1 > 0 {
                let prexField = self.view.viewWithTag(tag-1) as! UITextField
                
                prexField.becomeFirstResponder()
            }
        }
        else {
            if tag+1 <= 4 {
                let nextField = self.view.viewWithTag(tag+1) as! UITextField
                
                nextField.becomeFirstResponder()
            }
        }
        
        if tag == 4 {
            textField.resignFirstResponder()
            doVerify()
        }
    }
    
    func doVerify()
    {
        self.showIndicator("验证中", autoHide: true, afterDelay: true)
        self.performSelector(Selector("doShowHomePage"), withObject: nil, afterDelay: 1.0)
    }
    
    override func doBack()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func doShowHomePage()
    {
        let appDeg = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDeg.showHomePage()
    }
}
