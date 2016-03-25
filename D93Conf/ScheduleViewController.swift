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
    
    @IBOutlet weak var webViewConf: UIWebView!
    @IBOutlet weak var webViewEdu: UIWebView!
    
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
            
            webViewConf.hidden = false
            webViewEdu.hidden = true
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
            
            webViewConf.hidden = true
            webViewEdu.hidden = false
        }
    }
    
    func loadWebPage(urlstr: String) {
        var webView: UIWebView!
        if(urlstr == confSchedURL){ webView = self.webViewConf }
        else if(urlstr == eduSchedURL){ webView = self.webViewEdu }
        
        webView.allowsInlineMediaPlayback = true
        webView.mediaPlaybackRequiresUserAction = false
        webView.opaque = false
        
        let url = NSURL(string: urlstr)
        let requestObj = NSURLRequest(URL: url!)
        
        print("load web!! \(urlstr)")
        webView.loadRequest(requestObj)
    }
    
    func preloadWebView(){
        loadWebPage(confSchedURL)
        loadWebPage(eduSchedURL)
        webViewConf.hidden = false
        webViewEdu.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //setup button
        setButtonSettings()
        
        //load webview
        preloadWebView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
