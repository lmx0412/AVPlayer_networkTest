//
//  ViewController.swift
//  VideoTest1
//
//  Created by 刘孟轩 on 16/5/30.
//  Copyright © 2016年 刘孟轩. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var remoteButton: UIButton!
    @IBOutlet weak var localButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
            }
    
    
    
    @IBAction func localPlay(sender: AnyObject) {
        let playerLayer = AVPlayerLayer()
        playerLayer.frame = self.view.bounds
        let url = NSBundle.mainBundle().URLForResource("Test1", withExtension: "mp4")
        let url1 = "http://data.vod.itc.cn/?rb=1&prot=1&key=jbZhEJhlqlUN-Wj_HEI8BjaVqKNFvDrn&prod=flash&pt=1&new=/171/109/QTkejG8CpgVVhHzbJmX4nA.mp4"
        let url2 = NSURL(string: url1)
        let player = AVPlayer(URL: url!)
        player.actionAtItemEnd = .None
        playerLayer.player = player
        self.view.layer.addSublayer(playerLayer)        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerDidReachEndNotificationHandler:", name: "AVPlayerItemDidPlayToEndTimeNotification", object: player.currentItem)
        
        player.play()
     
    }
    @IBAction func remotePlay(sender: AnyObject) {
        let playerLayer = AVPlayerLayer()
        playerLayer.frame = self.view.bounds
        let url = NSBundle.mainBundle().URLForResource("Test1", withExtension: "mp4")
        let url1 = "http://videotest1.oss-cn-shanghai.aliyuncs.com/Test1/Test1.mp4?Expires=1465206661&OSSAccessKeyId=HUK9rBCgXlTLIpce&Signature=GML/S2cgZo4keNYN/3lcw%2BwDY9w%3D"
        let url2 = NSURL(string: url1)
        let player = AVPlayer(URL: url2!)
        player.actionAtItemEnd = .None
        playerLayer.player = player
        self.view.layer.addSublayer(playerLayer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerDidReachEndNotificationHandler:", name: "AVPlayerItemDidPlayToEndTimeNotification", object: player.currentItem)
        
        player.play()
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func playerDidReachEndNotificationHandler(notification: NSNotification) {
        let playerItem = notification.object as! AVPlayerItem
        playerItem.seekToTime(kCMTimeZero)
    }

}

