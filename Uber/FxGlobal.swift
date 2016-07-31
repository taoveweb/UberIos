//
//  FxGlobal.swift
//  Uber
//
//  Created by 黄 家金 on 16/7/31.
//  Copyright © 2016年 黄 家金. All rights reserved.
//

import Foundation
import UIKit

func isSystemIOS8() -> Bool {

    let verstion:NSString = UIDevice.currentDevice().systemVersion as NSString

    if( verstion.floatValue - IOS8 < -0.001){
        return true
    }
    
    return false
}