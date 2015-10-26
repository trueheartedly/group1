//
//  TimelineViewController.swift
//  Immunizations
//
//  Created by James Taylor on 10/25/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var pageTitle: UILabel!
//--TO IMPLEMENT: PRESERVE PHOTO FROM PRIOR SCREEN
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var birthdate: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = contentView.frame.size
 
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        self.navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 29/255, blue: 75/255, alpha: 1)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        //photoImageView.image = GlobalVariables.userPhotoImage.image
       // pageTitle?.text = userFirstName + "’s Vaccinations"
        //firstName?.text = userFirstName + "’s Birthday"
        //birthdate?.text = userBirthdate
    }

    
    
    
    // hide nav bar
    
//    override func viewWillAppear(animated: Bool) {
//        navigationController?.navigationBarHidden = true
//        super.viewWillAppear(animated)
//    }
//    
//    
//    override func viewWillDisappear(animated: Bool) {
//        if (navigationController?.topViewController != self) {
//            navigationController?.navigationBarHidden = false
//        }
//        super.viewWillDisappear(animated)
//    }
//    
//    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
