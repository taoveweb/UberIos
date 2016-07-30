//
//  HomePage-Map.swift
//  Uber
//
//  Created by hejinbo on 15/11/16.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import Foundation

class CarAnimationView: BMKAnnotationView {
    var imageView:UIImageView!
    
    override init!(annotation: BMKAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        self.bounds = CGRect(x: 0, y: 0, width: 32, height: 32)
        self.backgroundColor = UIColor.clearColor()
        
        imageView = UIImageView(image: UIImage(named: "map-taxi.png"))
        imageView.frame = self.bounds
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomePage:BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate,BMKPoiSearchDelegate,BMKRouteSearchDelegate {

    func addBaiDuMap()
    {
        mapView = BMKMapView(frame: self.view.bounds)
        self.view.addSubview(mapView!)
        mapView?.zoomLevel = 11
        
        geoCode = BMKGeoCodeSearch()
        poiSearch = BMKPoiSearch()
        routeSearch = BMKRouteSearch()
        
        startLocation()
    }
    
    @IBAction func doSearchPoi()
    {
        let option = BMKCitySearchOption()
        
        option.city = "北京"
        option.keyword = "北京南站"
        
        poiSearch?.poiSearchInCity(option)
    }
    
    func onGetPoiResult(searcher: BMKPoiSearch!, result poiResult: BMKPoiResult!, errorCode: BMKSearchErrorCode) {
        mapView?.removeAnnotations(mapView?.annotations)
        
        if errorCode == BMK_SEARCH_NO_ERROR {
            var annotations:[BMKPointAnnotation] = []
            for var i=0; i<poiResult.poiInfoList.count; i++ {
                let poi = poiResult.poiInfoList[i]
                let item = BMKPointAnnotation()
                
                item.coordinate = poi.pt
                item.title = poi.name
                
                annotations.insert(item, atIndex: i)
            }
            
            mapView?.addAnnotations(annotations)
            mapView?.showAnnotations(annotations, animated: true)
        }
        else {
            print("error")
        }
    }
    
    @IBAction func doSearchRoute()
    {
        let start = BMKPlanNode()
        start.name = "龙泽"
        let end = BMKPlanNode()
        end.name = "西单"
        
        let routeOption = BMKTransitRoutePlanOption()
        routeOption.city = "北京市"
        routeOption.from = start
        routeOption.to = end
        
        let flag:Bool! = routeSearch?.transitSearch(routeOption)
 
        if flag! {
            print("bus检索发送成功")
        }
        else {
            print("bus检索发送失败")
        }
    }
    
    func onGetTransitRouteResult(searcher: BMKRouteSearch!, result: BMKTransitRouteResult!, errorCode error: BMKSearchErrorCode) {
        if error == BMK_SEARCH_NO_ERROR {
            print("轨迹成功")
        }
        else {
            print("轨迹失败")
        }
        
    }
    
    func startLocation()
    {
        locService = BMKLocationService()
        locService?.delegate = self
        locService?.startUserLocationService()
        
        mapView?.showsUserLocation = true
        
        userCoordinate = CLLocationCoordinate2D(latitude: 40.115, longitude: 116.404)
    }
    
    func didUpdateBMKUserLocation(userLocation: BMKUserLocation!) {
//        userCoordinate = userLocation.location.coordinate
//        print(userCoordinate?.latitude)
//        mapView?.updateLocationData(userLocation)
        addCars()
        startTimer()
        getCarArraiveTime()
    }
    
    func addCars()
    {
        mapView?.removeOverlays(mapView?.overlays)
        if point != nil {
            mapView?.removeAnnotation(point)
        }
        
        point = BMKPointAnnotation()
        
        point!.coordinate = CLLocationCoordinate2D(latitude: userCoordinate!.latitude+0.002, longitude: userCoordinate!.longitude+0.002)
        point!.title="Car"
        
        mapView?.addAnnotation(point!)
    }
    
    func getCarArraiveTime()
    {
        let point1 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(39.915,116.404))
        let point2 = BMKMapPointForCoordinate(CLLocationCoordinate2DMake(38.915,115.404));
        
        let distance = BMKMetersBetweenMapPoints(point1,point2);
        
        print(distance)
        let time = distance / (50*1000)
        print(time)
    }
    
    func startTimer()
    {
        timer = NSTimer(timeInterval: 1.0, target: self, selector: Selector("updateCars"), userInfo: nil, repeats: true)
        timer!.fire()
    }
    
    func stopTimer()
    {
        timer?.invalidate()
    }
    
    func updateCars()
    {
        userCoordinate!.latitude += 0.02
        userCoordinate!.longitude += 0.02
        
        addCars()
    }

    func mapView(mapView: BMKMapView!, viewForAnnotation annotation: BMKAnnotation!) -> BMKAnnotationView! {
        let car = CarAnimationView(annotation: annotation, reuseIdentifier: "PID")
        
        car.draggable = false
        
        return car
    }
    
    func mapView(mapView: BMKMapView!, regionDidChangeAnimated animated: Bool) {
        
        let point = mapView.convertPoint(tuDingBtn!.center, toCoordinateFromView: self.view)
        print (point)
        
        let option = BMKReverseGeoCodeOption()
        option.reverseGeoPoint = point
        geoCode?.reverseGeoCode(option)
    }
    
    func onGetReverseGeoCodeResult(searcher: BMKGeoCodeSearch!, result: BMKReverseGeoCodeResult!, errorCode error: BMKSearchErrorCode) {
        address?.text = result.address
    }
}