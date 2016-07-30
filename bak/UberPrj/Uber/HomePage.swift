//
//  HomePage.swift
//  Uber
//
//  Created by hejinbo on 15/11/5.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class HomePage: FxBasePage,BMKMapViewDelegate,UIGestureRecognizerDelegate {
    
    var leftView:UIView?
    var backControl:UIControl!
    var showingLeft:Bool!
    var centerPage:UserCenterPage?
    
    var mapView:BMKMapView?
    var locService:BMKLocationService?
    var userCoordinate:CLLocationCoordinate2D?
    var timer:NSTimer?
    var point:BMKPointAnnotation?
    var geoCode:BMKGeoCodeSearch?
    var poiSearch:BMKPoiSearch?
    var routeSearch:BMKRouteSearch?
    
    @IBOutlet var bottomView:UIView?
    @IBOutlet var firtCar:UIButton?
    @IBOutlet var bottomImageView:UIImageView?
    @IBOutlet var feiYong:UILabel?
    @IBOutlet var endPos:UILabel?
    @IBOutlet var tuDingBtn:UIButton?
    @IBOutlet var address:UILabel?
    @IBOutlet var topView:UIView?
    
    var btnHelper:FxButtonHelper?
    var isMoveup:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addBaiDuMap()
        addBackControl()
        setNavigationItem("account_icon_up.png", selector: Selector("doShowLeft"), isRight: false)
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo_uber_grey_zh_CN.png"))
        
        btnHelper = FxButtonHelper()
        self.view.bringSubviewToFront(bottomView!)
        self.doSwapCar(firtCar!)
        addTapGesture()
        
        self.view.bringSubviewToFront(topView!)
        self.view.bringSubviewToFront(tuDingBtn!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        showingLeft = false
        isMoveup = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mapView?.delegate=self
        geoCode?.delegate = self
        poiSearch?.delegate = self
        routeSearch?.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.addLeftView()
        self.addUserCenterView()
        self.stopTimer()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        mapView?.delegate = nil
        geoCode?.delegate = nil
        poiSearch?.delegate = nil
        routeSearch?.delegate = nil
    }
    
    @IBAction func doSwapCar(sender:UIButton) {
        btnHelper!.normalImageName = "1.png"
        btnHelper!.selectedImageName = "CarBtn.png"
        
        btnHelper?.setButtonEx(sender)
    }
    
    func addTapGesture()
    {
        let tap = UITapGestureRecognizer(target: self, action: Selector("doTapBack"))
        
        tap.delegate = self
        bottomView?.addGestureRecognizer(tap)
    }
    
    func doTapBack()
    {
        isMoveup = !isMoveup
        animationView(isMoveup)
    }
    
    func animationView(moveup:Bool)
    {
        UIView.animateWithDuration(0.5, animations: {
            var frame = self.bottomView!.frame
            if moveup {
                frame.origin.y = self.view.bounds.size.height-frame.size.height;
            }
            else {
                frame.origin.y = self.view.bounds.size.height-80
            }
            
            self.bottomView!.frame = frame
        })
    }
    
    @IBAction func doGetCost(sender:UIButton)
    {
        sender.hidden = true
        bottomImageView?.image = UIImage(named: "FeiYongBack.png")
        feiYong?.text = "￥69-87"
        endPos?.text = "北京南站"
    }
}
