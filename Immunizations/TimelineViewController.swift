//
//  TimelineViewController.swift
//  Booster
//
//  Created by James Taylor on 10/25/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var photoImageView: UIImageView!

//--TO IMPLEMENT: PRESERVE PHOTO FROM PRIOR SCREEN
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    
    var localNotification = UILocalNotification()
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        application.applicationIconBadgeNumber = 0
        // Point for handling the local notification when the app is open.
        // Showing reminder details in an alertview
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set pronoun of user
        if userSex == "M" {
            userPronoun = "his"
        } else {
            userPronoun = "her"
        }
        

        scrollView.delegate = self
        scrollView.contentSize = contentView.frame.size
 
        self.title = userFirstName! + "’s Vaccinations"
//        
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//
//        self.navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 29/255, blue: 75/255, alpha: 1)
//        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        photoImageView.image = userPhotoImage
        
        // mask photo as a circle
        photoImageView.layer.cornerRadius = photoImageView.frame.size.height/2
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.borderWidth = 0
        
        //pageTitle.text = userFirstName! + "’s Vaccinations"
        firstName.text = userFirstName! + "’s Birthday"
        birthdate?.text = userBirthDateString
        
        
        // NOTIFICATION LOGIC
        
        if hepB2Date != nil{
            
            // calculate time before next hep b shot is due
            let calendar: NSCalendar = NSCalendar.currentCalendar()
            
            // Replace the hour (time) of both dates with 00:00
            let date1 = calendar.startOfDayForDate(NSDate())
            let date2 = calendar.startOfDayForDate(hepB2Date!)
            
            //let flags = NSCalendarUnit.DayCalendarUnit
            let components = calendar.components(.Day, fromDate: date1, toDate: date2, options: [])
            
            let daysToHepShot2Due = components.day  // This will return the number of day(s) between dates
            
            
            print(daysToHepShot2Due)
            
            
            // SET NOTIFICATION
            
            if userReceiveReminders == true {
                localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
                localNotification.alertBody = "\(userFirstName!) is due for \(userPronoun!) Hepatitis B Vaccination in \(daysToHepShot2Due) days"
                localNotification.timeZone = NSTimeZone.defaultTimeZone()
                localNotification.soundName = UILocalNotificationDefaultSoundName
                localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
                
                UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
            }
        }
        
    }
    
    
    @IBAction func didPressShare(sender: AnyObject) {
        
        let textToShare = "\(userFirstName)'s Immunization Record"
        
        if let myWebsite = NSURL(string: "")
        {
            let objectsToShare = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //New Excluded Activities Code
            activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
            //
            
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
