//
//  GuidePage.swift
//  Uber
//
//  Created by 黄 家金 on 16/7/30.
//  Copyright © 2016年 黄 家金. All rights reserved.
//

import UIKit
import AVFoundation

class GuidePage: FxBasePage {
    
    @IBOutlet var BackImageView:UIImageView?
    @IBOutlet var backView:UIView?
    
    var player:AVPlayer!
    var playerItem:AVPlayerItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPlayVideo()
        doAnimation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func doAnimation()  {
        var images:[UIImage] = []
        var imageName:String
        var img:UIImage
        for index in 0...67{
            
            imageName = "logo-" + String(format:"%03d", index)
            img = UIImage(named: imageName)!
            images.insert(img, atIndex: index)
        }
        
        BackImageView!.animationImages = images
        BackImageView!.animationRepeatCount = 1
        BackImageView!.animationDuration = 5
        
        BackImageView!.startAnimating()
        
        UIView.animateWithDuration(0.7, delay: 5, options: .CurveEaseOut, animations: {
            self.backView?.alpha = 1.0
            self.player.play()
            }, completion: {
                finished in print("animation end")
        })
    }
    
    
    func initPlayVideo() {
        let path = NSBundle.mainBundle().pathForResource("welcome_video", ofType: "mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        playerItem = AVPlayerItem(URL: url)
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = UIScreen.mainScreen().bounds
        playerLayer.videoGravity =  AVLayerVideoGravityResizeAspect
        
        backView!.layer.insertSublayer(playerLayer, atIndex: 0)
        backView!.alpha = 0.0
        
        NSNotificationCenter.defaultCenter().addObserver ( self,
                                                           selector: #selector(GuidePage.didFinishVideo(_:)) ,
                                                           name: AVPlayerItemDidPlayToEndTimeNotification ,
                                                           object: playerItem)
    }
    
    func didFinishVideo(sender: NSNotification )
    {
        let item = sender.object as! AVPlayerItem
        
        item.seekToTime(kCMTimeZero)
        
        self.player.play()
    }
    
    
}
