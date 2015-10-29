//
//  ImmunizationViewController.swift
//  Booster
//
//  Created by James Taylor on 10/25/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit

class ImmunizationViewController: UIViewController, UIScrollViewDelegate {
        
        
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 29/255, blue: 75/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        scrollView.delegate = self
        scrollView.contentSize = imageView.image!.size
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
