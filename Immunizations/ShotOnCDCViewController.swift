//
//  ShotOnCDCViewController.swift
//  Booster
//
//  Created by James Taylor on 11/2/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit

class ShotOnCDCViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL (string: "https://www.nlm.nih.gov/medlineplus/ency/article/000279.htm");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        
    }
    
    @IBAction func didPressClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
}
