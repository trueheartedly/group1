//
//  ImmunizationViewController.swift
//  Booster
//
//  Created by James Taylor on 10/25/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit

class ImmunizationViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate  {
    
    
    
    
    var shotDescriptions: [String]!
    
    


    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    @IBOutlet weak var firstName: UILabel!
        
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    var hepB2DateString: String!

    var hepB1Complete:Bool = false
    var hepB2Complete:Bool = false
    var hepB3Complete:Bool = false
    
    @IBOutlet weak var datePickerView: UIView!
    var hepB1Open:Bool = false
    var hepB2Open:Bool = false
    var hepB3Open:Bool = false

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var moreAbout: UIImageView!
    
    var moreAboutOriginY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        shotDescriptions = ["First shot on day of birth", "Second shot on the 1st month", "Third shot on the 6th month"]
        

        showHideBadges()
        
        datePickerView.hidden = true
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 29/255, blue: 75/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        moreAboutOriginY = moreAbout.frame.origin.y
        
        scrollView.delegate = self
        scrollView.contentSize.height = moreAbout.image!.size.height + moreAboutOriginY

        
        firstName.text = userFirstName! + "’s Progress"
        print(userFirstName! + "’s Progress")
        


        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }


//    @IBAction func didPressHepB2(sender: AnyObject? = nil) {
//        print(hepB2Open)
//        if hepB2Open == false {
//            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
//                self.hepB2View.frame.size.height = 160
//                self.moreAbout.frame.origin.y = self.moreAboutOriginY + 160
//                self.hepB2View.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
//                self.hepB2DateLabel.hidden = true
//                self.hepB2CloseButton.hidden = false
//                self.hepB2Button.enabled = false
//                }) { (Bool) -> Void in
//                    self.hepB2Open = true
//                    print(self.hepB2View.frame.size.height)
//            }
//        } else {
//            print("time to close b2")
//            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
//                self.hepB2View.frame.size.height = 40
//                self.moreAbout.frame.origin.y = self.moreAboutOriginY
//                self.hepB2DateLabel.hidden = false
//                self.hepB2CloseButton.hidden = true
//                self.hepB2Button.enabled = true
//                }) { (Bool) -> Void in
//                    self.hepB2Open = false
//            }
//        }
//        showHideBadges()
//    }
    
    
    
 
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shotDescriptions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ShotTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ShotTableViewCell
        
        cell.shotDescriptionLabel.text = shotDescriptions[indexPath.row]
        
        cell.shotCloseButton.hidden = true
                //cell.shotDateButton.layer.cornerRadius = 8
                cell.shotView.layer.cornerRadius = 8
                cell.shotView.layer.borderWidth = 1
                cell.shotView.layer.borderColor = UIColor(red:204/255.0, green:214/255.0, blue:221/255.0, alpha: 1.0).CGColor
                cell.shotCompleteButton.layer.cornerRadius = 8
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
 
    
    
    
    
    
    func showHideBadges() {
        
//        if hepB1Complete == true {
//            hepB1IncompleteBadge.hidden = true
//            hepB1CompleteBadge.hidden = false
//        } else {
//            hepB1IncompleteBadge.hidden = false
//            hepB1CompleteBadge.hidden = true
//        }
//        
//        if hepB2Complete == true {
//            hepB2IncompleteBadge.hidden = true
//            hepB2CompleteBadge.hidden = false
//        } else {
//            hepB2IncompleteBadge.hidden = false
//            hepB2CompleteBadge.hidden = true
//        }

//        if hepB3Complete == true {
//            hepB3IncompleteBadge.hidden = true
//            hepB3CompleteBadge.hidden = false
//        } else {
//            hepB3IncompleteBadge.hidden = false
//            hepB3CompleteBadge.hidden = true
//        }
        
        
    }
    
    
    

    
    
}