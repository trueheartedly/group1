//
//  TimelineViewController.swift
//  Booster
//
//  Created by James Taylor on 10/25/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UIScrollViewDelegate {
    
//--LOADING ANIMATION
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var shieldImage: UIImageView!
    @IBOutlet var screenView: UIView!
    
    @IBOutlet weak var shotBadgeOverdueImage: UIImageView!
    
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var loading_4: UIImage!
    var loading_5: UIImage!
    var loading_6: UIImage!
    var loading_7: UIImage!
    var loading_8: UIImage!

    
    
//--IMMUNIZATION

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIImageView!

    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var avatarButton: UIButton!
    var viewOriginalY: CGFloat!
    @IBOutlet weak var shotButton: UIButton!
   
    

    
//--TO IMPLEMENT: PRESERVE PHOTO FROM PRIOR SCREEN
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    @IBOutlet weak var screenLabel: UILabel!

    var localNotification = UILocalNotification()
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        application.applicationIconBadgeNumber = 0
        // Point for handling the local notification when the app is open.
        // Showing reminder details in an alertview
    }

    
    
// TRIGGER LOADING ANIMATION
    
    override func viewDidAppear(animated: Bool){
        
        //     shieldBounce()
        
        UIView.animateWithDuration(1, delay: 0, options: [UIViewAnimationOptions.Repeat], animations:{ () -> Void in
            self.loadingImage.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            }, completion:{ (Bool) -> Void in })
        
        loading_1 = UIImage(named: "loadingcircle-1")
        loading_2 = UIImage(named: "loadingcirlce-2")
        loading_3 = UIImage(named: "loadingcircle-3")
        loading_4 = UIImage(named: "loadingcircle-4")
        loading_5 = UIImage(named: "loadingcirlce-5")
        loading_6 = UIImage(named: "loadingcircle-6")
        loading_7 = UIImage(named: "loadingcircle-7")
        loading_8 = UIImage(named: "loadingcircle-8")
        
        /* images = [loading_1, loading_2, loading_3]
        
        
        animatedImage = UIImage.animatedImageWithImages(images,duration: 1.0)
        loadingImage.image = animatedImage*/
        
        
        UIView.animateWithDuration(0.5, delay: 2.5, options: [], animations:{ () -> Void in
            
            self.loadingView.alpha = 0
            self.shieldImage.alpha = 0
            
            }, completion:{ (Bool) -> Void in })
        
        // if hepb1 complete, show so

        print("hepb1 is complete = \(hepB1Complete)")
        if hepB1Complete == true {
            contentView.image = UIImage(named: "Immunization_Timeline_HepB")
            shotBadgeOverdueImage.hidden = true
            shotButton.frame.origin.y = 245
        } else {
            shotBadgeOverdueImage.hidden = false
        }
    }
    
    
//-- VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set pronoun of user
        if userSex == "M" {
            userPronoun = "his"
        } else {
            userPronoun = "her"
        }
        

        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 375, height: 744)
        viewOriginalY = scrollView.frame.origin.y
        screenLabel.text = userFirstName! + "’s Immunizations"
        
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
    func scrollViewDidScroll(scrollView: UIScrollView){
        //print("scrolling")
        print(scrollView.contentOffset.y)
        print(scrollView.frame.origin.y)
        
        scrollView.frame.origin.y = viewOriginalY - scrollView.contentOffset.y
        
        if scrollView.contentOffset.y >= 104{
            scrollView.frame.origin.y = 76
        }
        // avatarButton.alpha = 0
        updateTransform(photoImageView, offset: scrollView.contentOffset.y)
        
    }
    
    func updateTransform(photoImageView: UIView, offset: CGFloat) {
        
        let avatar_ty = convertValue(scrollView.contentOffset.y, r1Min: 0, r1Max: 104, r2Min: 0, r2Max: -34)
        
        let avatar_tx = convertValue(scrollView.contentOffset.y, r1Min: 0, r1Max: 104, r2Min: 0, r2Max: -74)
        
        let avatar_scale = convertValue(scrollView.contentOffset.y, r1Min: 0, r1Max: 104, r2Min: 1, r2Max: 0.74)
        
        let label_ty = convertValue(scrollView.contentOffset.y, r1Min: 0, r1Max: 104, r2Min: 0, r2Max: 0)
        
        let label_tx = convertValue(scrollView.contentOffset.y, r1Min: 0, r1Max: 104, r2Min: 0, r2Max: 5)
        
        photoImageView.transform = CGAffineTransformMakeTranslation(avatar_tx, avatar_ty)
        photoImageView.transform = CGAffineTransformScale(photoImageView.transform, avatar_scale, avatar_scale)
        avatarButton.transform = CGAffineTransformMakeTranslation(avatar_tx, avatar_ty)
        avatarButton.transform = CGAffineTransformScale(photoImageView.transform, avatar_scale, avatar_scale)
        
        screenLabel.transform = CGAffineTransformMakeTranslation(label_tx, label_ty)
        
        
        
        
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
    
    
    func shieldBounce(){
        UIView.animateWithDuration(0.8, delay: 0, options: [UIViewAnimationOptions.Autoreverse, UIViewAnimationOptions.Repeat], animations: { () -> Void in
            self.shieldImage.transform = CGAffineTransformMakeTranslation(0, -5)
            }, completion: nil)
    }
    
    func loadAnimation(){
        
        
        
    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }


}
