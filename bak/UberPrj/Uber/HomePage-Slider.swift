//
//  HomePage-Slider.swift
//  Uber
//
//  Created by hejinbo on 15/11/16.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import Foundation

extension HomePage {
    @IBAction func doShowLeft(){

        if showingLeft! {
            showCenterPanel()
        }
        else {
            showLeftPanel()
        }
    }
    
    func doTapCenter(sender:UIButton)
    {
        if showingLeft! {
            showCenterPanel()
        }
    }
    
    func addUserCenterView()
    {
        centerPage = UserCenterPage()
        
        centerPage!.owner = self;
        centerPage!.view.frame = leftView!.bounds
        
        leftView?.addSubview(centerPage!.view)
    }
    
    func doShowSetting()
    {
        showCenterPanel()
        self.navigationController!.view.sendSubviewToBack(backControl)
        
        let page = SettingPage()
        let navPage = UINavigationController(rootViewController: page)
        
        self.presentViewController(navPage, animated: true, completion: nil)
    }
    
    func addLeftView() {
        if leftView == nil {
            var frame:CGRect! = self.navigationController!.view.bounds
            
            frame.origin.x = -frame.size.width+PanWidth
            frame.size.width -= PanWidth
            
            leftView = UIView(frame: frame)
            leftView?.backgroundColor = UIColor.blackColor()
            self.navigationController?.view.addSubview(leftView!)
        }
    }
    
    func addBackControl() {
        if backControl == nil {
            let frame = self.navigationController!.view.bounds;
            backControl = UIControl(frame: frame)
            backControl.backgroundColor = UIColor.blackColor()
            backControl.alpha = 0.5
            backControl.addTarget(self, action: Selector("doTapCenter:"), forControlEvents: .TouchUpInside);
            
            self.navigationController!.view.addSubview(backControl)
            self.navigationController!.view.sendSubviewToBack(backControl)
        }
    }
    
    func showCenterView(view:UIView,offset:CGFloat,shadow:Bool) {
        if shadow {
            view.layer.shadowColor = UIColor.blackColor().CGColor
            view.layer.shadowOpacity = 0.2
            view.layer.shadowOffset = CGSizeMake(offset, offset)
        }
        else {
            view.layer.cornerRadius = 0.0
            view.layer.shadowOpacity = 0.0
            view.layer.shadowOffset = CGSizeMake(offset, offset)
        }
    }
    
    func showLeftPanel() {
        showingLeft = true
        showCenterView(leftView!, offset: -2, shadow: true)
        
        UIView.animateWithDuration(1.0, delay: 0, options: .BeginFromCurrentState, animations: {
            var frame = self.leftView?.frame
            frame?.origin.x = 0
            self.leftView?.frame = frame!
            
            frame = self.navigationController?.navigationBar.frame
            frame?.origin.x = (frame?.size.width)! - PanWidth
            self.navigationController?.navigationBar.frame = frame!
            }, completion: {(fished:Bool) in
                if fished {
                    self.navigationController!.view.bringSubviewToFront(self.backControl)
                    self.navigationController!.view.bringSubviewToFront(self.leftView!)
                }
                
        });
    }
    
    func showCenterPanel() {
        showingLeft = false
        
        UIView.animateWithDuration(1.0, delay: 0, options: .BeginFromCurrentState, animations: {
            var frame = self.leftView?.frame
            frame?.origin.x = -frame!.size.width
            self.leftView?.frame = frame!
            
            frame = self.navigationController?.navigationBar.frame
            frame?.origin.x = 0
            self.navigationController?.navigationBar.frame = frame!
            }, completion: {(fished:Bool) in
                if fished {
                    self.navigationController!.view.sendSubviewToBack(self.backControl)
                    self.showCenterView(self.leftView!, offset: 0, shadow: false)
                }
        });
        
    }
}