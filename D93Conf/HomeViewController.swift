//
//  HomeViewController.swift
//  D93Conf
//
//  Created by Steve Song on 3/23/16.
//  Copyright © 2016 magendas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    let mainViewURL = "http://magendas-stage.com/service/toast-master/view/mobile/event/2016_PREMIERE_CONFERENCE_D93.php"
    
    func loadMainWebPage() {
        
        if(webView.request != nil) {
            if(webView.request!.URL?.absoluteString == mainViewURL) {
                print("same URL.. no update")
                return
            }
        }
        
        
        webView.allowsInlineMediaPlayback = true
        webView.mediaPlaybackRequiresUserAction = false
        webView.opaque = false
        
        
        let url = NSURL(string: mainViewURL)
        
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
        
        
        print("load main web..")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadMainWebPage()
        print("Home.. viewDidLoad")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        print("HOME")
    }

}

