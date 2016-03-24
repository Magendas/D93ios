//
//  ScheduleViewController.swift
//  D93Conf
//
//  Created by Steve Song on 3/23/16.
//  Copyright © 2016 magendas. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var eduSchedButton: UIButton!
    @IBOutlet weak var confSchedButton: UIButton!
    @IBOutlet weak var webView: UIWebView!
    
    let confSchedURL: String = "http://magendas-stage.com/service/toast-master/view/mobile/event/2016_PREMIERE_CONFERENCE_D93_program_schedule.php"
    let eduSchedURL: String = "http://magendas-stage.com/service/toast-master/view/mobile/event/2016_PREMIERE_CONFERENCE_D93_education_schedule.php"
    
    var currentButton: UIButton!
    let colorWhite = AppColors().White
    let colorMargenta = AppColors().Margenta
    
    func setButtonSettings() {
        currentButton = confSchedButton
    }
    
    @IBAction func onConfSchedButtonTouchUpInside() {
        if currentButton == eduSchedButton{
            //change!
            currentButton = confSchedButton
            confSchedButton.tintColor = colorWhite
            confSchedButton.backgroundColor = colorMargenta
            eduSchedButton.tintColor = colorMargenta
            eduSchedButton.backgroundColor = colorWhite
            loadWebPage(confSchedURL)
        }
    }
    
    @IBAction func onEduSchedButtonTouchUpInside() {
        if(currentButton == confSchedButton) {
            //change!
            currentButton = eduSchedButton
            confSchedButton.tintColor = colorMargenta
            confSchedButton.backgroundColor = colorWhite
            eduSchedButton.tintColor = colorWhite
            eduSchedButton.backgroundColor = colorMargenta
            loadWebPage(eduSchedURL)
        }
    }
    
    
    func loadWebPage(url: String) {
        webView.allowsInlineMediaPlayback = true
        webView.mediaPlaybackRequiresUserAction = false
        webView.opaque = false
        
        let url = NSURL(string: url)
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //setup button
        setButtonSettings()
        
        //load conf sched url first..
        loadWebPage(confSchedURL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
