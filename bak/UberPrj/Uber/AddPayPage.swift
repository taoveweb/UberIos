
//
//  AddPayPage.swift
//  Uber
//
//  Created by hejinbo on 15/10/22.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class AddPayPage: FxBasePage,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView:UITableView!
    var datas:[PayInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "添加付款方式"
        setNavigationItem("Back.png", selector: "doBack", isRight: false)
        setNavigationItem("验证", selector: "doVerifyPhone", isRight: true)
        
        initDatas()
        
        //创建一个重用的单元格
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellID1")

        self.tableView.reloadData()
    }
    
    func doVerifyPhone()
    {
        let page = VerifyPhonePage()
        let navPage = UINavigationController(rootViewController: page)

        self.presentViewController(navPage, animated: true, completion: nil)
    }
    
    func initDatas()
    {
        var data:PayInfo!
        let dict:[String:String] = [
            "百度钱包" : "BaiDuWallet.png",
            "银联" : "YinLian.png",
            "支付宝" : "AliPay.png",
            "国际信用卡" : "CreditCard.png"]
        
        datas = []
        for (key,value) in dict {
            data = PayInfo()
            
            data.name = key
            data.icon = value
            
            datas?.append(data)
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        cell.selectedBackgroundView?.backgroundColor=UIColor.clearColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell
    {
        let identify:String = "CellID1"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
            as UITableViewCell
        
        let data = datas[indexPath.row]
 
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = data.name
        cell.imageView?.image = UIImage(named: data.icon)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
        let page = YinLianPage()
        self.navigationController?.pushViewController(page, animated: true)
    }
}
