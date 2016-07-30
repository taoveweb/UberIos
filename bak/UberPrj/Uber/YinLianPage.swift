//
//  YinLianPage.swift
//  Uber
//
//  Created by hejinbo on 15/11/2.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class YinLianPage: FxBasePage,UPPayPluginDelegate,NSURLConnectionDataDelegate {
    
    var responseData:NSMutableData?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func doPay() {
        let url = NSURL(string:YLTnURL)
        startPay(url!)
    }
    
    func startPay(url:NSURL) {
        let urlRequest = NSURLRequest(URL: url)
        let connect = NSURLConnection(request: urlRequest, delegate: self)
        
        connect?.start()
    }
    
    // 支付回调函数
    func UPPayPluginResult(result: String!) {
        FxLog(result)
    }
    
    // URLConnectionDelegate methods
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        let urlResponse = response as! NSHTTPURLResponse
        
        if urlResponse.statusCode != 200 {
            FxLog("error status code")
        }
        else {
            responseData = NSMutableData()
        }
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        responseData?.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let result = String(data: responseData!, encoding: NSUTF8StringEncoding)
        
        if result != nil {
            FxPayPlugin.startPayFx(result, mode: "01", viewController: self, delegate: self)
        }
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        FxLog(error.localizedFailureReason!)
    }

}
