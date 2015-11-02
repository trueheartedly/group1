//
//  ImmunizationViewController.swift
//  Booster
//
//  Created by James Taylor on 10/25/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit

class ImmunizationViewController: UIViewController, UIScrollViewDelegate {
        
    @IBOutlet weak var firstName: UILabel!
        
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    

    @IBOutlet weak var hepB2Label: UILabel!
    @IBOutlet weak var hepB2View: UIView!
    @IBOutlet weak var hepB1Date: UILabel!
    @IBOutlet weak var hepB2Button: UIButton!
    @IBOutlet weak var hepB2DatePickerLabel: UILabel!
    
    var hepB2DateString: String!
    
    @IBOutlet weak var hepB2IncompleteBadge: UIImageView!
    @IBOutlet weak var hepB2CompleteBadge: UIImageView!
    var hepB1Complete:Bool = false
    var hepB2Complete:Bool = false
    var hepB3Complete:Bool = false
    
    @IBOutlet weak var datePickerView: UIView!
    var hepB1Open:Bool = false
    var hepB2Open:Bool = false
    var hepB3Open:Bool = false

    @IBOutlet weak var hepB2DateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var shotDateButton: UIButton!
    @IBOutlet weak var shotDateView: UIView!
    @IBOutlet weak var hepB2CompleteButton: UIButton!
    
    @IBOutlet weak var hepB2CloseButton: UIButton!
    
    @IBOutlet weak var moreAbout: UIImageView!
    
    var moreAboutOriginY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showHideBadges()
        
        hepB2CloseButton.hidden = true
        datePickerView.hidden = true
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 29/255, blue: 75/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        moreAboutOriginY = moreAbout.frame.origin.y
        
        scrollView.delegate = self
        scrollView.contentSize.height = moreAbout.image!.size.height + moreAboutOriginY

        
        firstName.text = userFirstName! + "’s Progress"
        print(userFirstName! + "’s Progress")
        
        shotDateButton.layer.cornerRadius = 8
        hepB2View.layer.cornerRadius = 8
        hepB2View.layer.borderWidth = 1
        hepB2View.layer.borderColor = UIColor(red:204/255.0, green:214/255.0, blue:221/255.0, alpha: 1.0).CGColor
        hepB2CompleteButton.layer.cornerRadius = 8
        
        

        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }


    @IBAction func didPressHepB2(sender: AnyObject? = nil) {
        print(hepB2Open)
        if hepB2Open == false {
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.hepB2View.frame.size.height = 160
                self.moreAbout.frame.origin.y = self.moreAboutOriginY + 160
                self.hepB2View.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
                self.hepB2DateLabel.hidden = true
                self.hepB2CloseButton.hidden = false
                self.hepB2Button.enabled = false
                }) { (Bool) -> Void in
                    self.hepB2Open = true
                    print(self.hepB2View.frame.size.height)
            }
        } else {
            print("time to close b2")
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.hepB2View.frame.size.height = 40
                self.moreAbout.frame.origin.y = self.moreAboutOriginY
                self.hepB2DateLabel.hidden = false
                self.hepB2CloseButton.hidden = true
                self.hepB2Button.enabled = true
                }) { (Bool) -> Void in
                    self.hepB2Open = false
            }
        }
        showHideBadges()
    }
    
    
    @IBAction func didPressHepB2Complete(sender: AnyObject) {
        print(hepB2Date)
        if hepB2Date != nil{
            hepB2Complete = true
            didPressHepB2()
            hepB2Label.text = "Completed!"
            hepB2Label.textColor = UIColor(red:57/255.0, green:223/255.0, blue:183/255.0, alpha: 1.0)
            hepB2View.layer.borderColor = UIColor(red:57/255.0, green:223/255.0, blue:183/255.0, alpha: 1.0).CGColor
            hepB2View.layer.backgroundColor = UIColor
                .whiteColor().CGColor
            hepB2DateLabel.text = hepB2DateString
        }
    }

    
    
    @IBAction func didPressHepB2Close(sender: AnyObject) {
        didPressHepB2()
    }
    
    
    
    
    
    // SHOT DATE PICKER ------------------------------------------------------------------
    
    // on press of shotdate
    @IBAction func didPressDatePicker(sender: AnyObject) {
        datePickerView.hidden = false
    }
    
    // on select of date
    func datePickerChanged(datePicker:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        hepB2Date = datePicker.date

        hepB2DateString = dateFormatter.stringFromDate(datePicker.date)
        
        hepB2DatePickerLabel.text = hepB2DateString
        
        hepB2DatePickerLabel.textColor = UIColor(red: 3.0/255, green: 3.0/255, blue: 3.0/255, alpha: 1.0)
        print(hepB2Date)
        print(hepB2DateString)
    }
    
    // on press of done date picker
    @IBAction func didPressDatePickerDone(sender: UIButton) {
        
        //datePickerChanged(datePicker)
        datePickerView.hidden = true
        
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
        if hepB2Complete == true {
            hepB2IncompleteBadge.hidden = true
            hepB2CompleteBadge.hidden = false
        } else {
            hepB2IncompleteBadge.hidden = false
            hepB2CompleteBadge.hidden = true
        }

//        if hepB3Complete == true {
//            hepB3IncompleteBadge.hidden = true
//            hepB3CompleteBadge.hidden = false
//        } else {
//            hepB3IncompleteBadge.hidden = false
//            hepB3CompleteBadge.hidden = true
//        }
        
        
    }
    
    
    
    
    
    
}