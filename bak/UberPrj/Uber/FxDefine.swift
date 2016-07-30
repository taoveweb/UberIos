
//
//  FxDefine.swift
//  Uber
//
//  Created by hejinbo on 15/10/12.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import Foundation
import UIKit

// 常量=》ObjectC 宏
let LoadingTip="加载中..."
let iOS8:Float = 8.0
let ScreenHeight = UIScreen.mainScreen().bounds.size.height
let PanWidth:CGFloat = 100

func FxLog(message:String, function:String = __FUNCTION__)
{
    #if DEBUG
        print("Log:\(message),\(function)")
    #else
        
    #endif
}

func isiPhone5()->Bool
{
    #if os(iOS)
        FxLog("iOS")
    #else
        
    #endif
    
    if ScreenHeight == 568 {
        return true
    }
    
    return false
}