//
//  FxDefine.swift
//  Uber
//
//  Created by 黄 家金 on 16/7/31.
//  Copyright © 2016年 黄 家金. All rights reserved.
//

import Foundation
import UIKit
let LoadingTip = "加载中..."
let ScreenHeight = UIScreen.mainScreen().bounds.size.height
let IOS8:Float = 8.0
func FxLog(message:String,function:String = #function) {
    
    
    #if DEBUG
        print("log:\(message),\(function)")
    #else
    
    #endif
    
}


func isiPhone5() -> Bool {
    
    #if os(iOS)
        FxLog("ios")
    #else
    #endif
    
    if ScreenHeight == 568 {
        return true
    }
        
    return false
    
}