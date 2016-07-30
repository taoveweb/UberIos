
//
//  FxGlobal.swift
//  Uber
//
//  Created by hejinbo on 15/10/12.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import Foundation
import UIKit

func isSystemiOS8()->Bool
{
    let version:NSString = UIDevice.currentDevice().systemVersion as NSString
 
    if (version.floatValue - iOS8 < -0.001) {
        return true;
    }
    
    return false;
}