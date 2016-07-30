//
//  FxURLDefine.swift
//  Uber
//
//  Created by hejinbo on 15/10/12.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import Foundation

#if buildAppStore
    
#endif

func ServerAddress()->String
{
    var address = "http://172.16.19.18"
    
    #if AppStore
        address = "http://www.uber.com"
    #endif
    
    return address
}

let YLTnURL = "http://202.101.25.178:8080/sim/gettn"