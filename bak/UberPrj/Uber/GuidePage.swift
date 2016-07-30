//
//  GuidePage.swift
//  Uber
//
//  Created by hejinbo on 15/10/9.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit
import AVFoundation

class GuidePage: FxBasePage {

    @IBOutlet var backImageView:UIImageView?
    
    var player:AVPlayer!
    var playerItem:AVPlayerItem!
    var location:FxLocation!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init ()
    {
        var nibNameOrNil = String?("GuidePage")
        
        //考虑到xib文件可能不存在或被删，故加入判断
        if NSBundle.mainBundle().pathForResource(nibNameOrNil, ofType: "nib") == nil {
            nibNameOrNil = nil
        }
        
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        initPlayVideo()
        doAnimation()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    func doAnimation()
    {
        var images:[UIImage]=[]
        var image:UIImage?
        var imageName:String?
        
        for var index=0; index<=67;index++ {
            imageName = "logo-" + String(format: "%03d", index)
            image = UIImage(named: imageName!)
            
            images.insert(image!, atIndex: index)
        }
        
        backImageView?.animationImages = images
        backImageView?.animationRepeatCount = 1
        backImageView?.animationDuration = 5
        
        backImageView?.startAnimating()
        
        UIView.animateWithDuration(0.7, delay:5, options: .CurveEaseOut, animations: {
                self.backView!.alpha = 1.0
                self.player?.play()
            }, completion: {
                finished in
                print("Animation End")
        })
    }
    
    func initPlayVideo ()
    {
        let path = NSBundle.mainBundle().pathForResource("welcome_video", ofType: "mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        playerItem = AVPlayerItem(URL: url)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = backView!.bounds
        playerLayer.videoGravity =  AVLayerVideoGravityResizeAspect
        
        backView!.layer.insertSublayer(playerLayer, atIndex: 0)
        backView!.alpha = 0.0
        
        NSNotificationCenter.defaultCenter().addObserver ( self,
            selector: "didFinishVideo:" ,
            name: AVPlayerItemDidPlayToEndTimeNotification ,
            object: playerItem)
    }
    
    func didFinishVideo(sender: NSNotification )
    {
        let item = sender.object as! AVPlayerItem
        
        item.seekToTime(kCMTimeZero)
        
        self.player.play()
    }
    
    @IBAction func doLogin()
    {
        location = FxLocation()
        location.startLocation()
    }
    
    @IBAction func doRegister()
    {
        let page = CreateAccountPage()
        let navPage = UINavigationController(rootViewController: page)
        
        self.presentViewController(navPage, animated: true, completion: nil)
    }
}
