//
//  FxBaseController.swift
//  Uber
//
//  Created by hejinbo on 15/10/9.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class FxBaseController: UIViewController {
    
    var activity:FxActivity?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    private func showActivityInView(view:UIView) ->FxActivity
    {
        let activity = FxActivityIndicator(view: view)
        
        activity.frame = view.bounds
        view.addSubview(activity)
        activity.labelText = ""
        
        return activity
    }
    
    func showIndicator(tipMessage:String?,
        autoHide:Bool, afterDelay:Bool)
    {
        if activity == nil {
            activity = showActivityInView(self.view)
        }
        
        if tipMessage != nil {
            activity?.labelText = tipMessage
            activity?.show(false)
        }
        
        if autoHide && activity?.alpha>=1.0 {
            if afterDelay {
                activity?.hide(true, afterDelay: 1.0)
            }
            else {
                activity?.hide(true)
            }
        }
    }
    
    func hideIndicator()
    {
        activity?.hide(true)
    }
}
