//
//  FxURLDefine.swift
//  Uber
//
//  Created by 黄 家金 on 16/7/31.
//  Copyright © 2016年 黄 家金. All rights reserved.
//

import Foundation

func ServerAddress() -> String {
    var serverAddress = "http://192.168.1.5"
    #if AppStore
        serverAddress = "http://www.oldku.com"
    #endif
    
    return serverAddress
}
