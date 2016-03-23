//
//  HomeViewController.swift
//  D93Conf
//
//  Created by Steve Song on 3/23/16.
//  Copyright © 2016 magendas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!
    
    func loadMainWebPage() {
        webView.allowsInlineMediaPlayback = true
        webView.mediaPlaybackRequiresUserAction = false
        webView.opaque = false
        
        
        let url = NSURL(string: "http://magendas-stage.com/service/toast-master/view/mobile/event/2016_PREMIERE_CONFERENCE_D93.php")
        
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadMainWebPage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

