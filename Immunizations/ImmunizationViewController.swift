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
    
    @IBOutlet weak var hepB1View: UIView!
    @IBOutlet weak var hepB1Button: UIButton!
    @IBOutlet weak var hepB1Label: UILabel!
    @IBOutlet weak var hepB1DateLabel: UILabel!
    @IBOutlet weak var hepB1IncompleteBadge: UIImageView!
    @IBOutlet weak var hepB1CompleteBadge: UIImageView!
    @IBOutlet weak var hepB1CloseButton: UIButton!
    @IBOutlet weak var hepB1DatePickerLabel: UILabel!
    @IBOutlet weak var hepB1CompleteButton: UIButton!
    @IBOutlet weak var hepB1DatePickerButton: UIButton!
    var hepB1DateString: String!

    
    @IBOutlet weak var hepB2View: UIView!
    @IBOutlet weak var hepB2Button: UIButton!
    @IBOutlet weak var hepB2Label: UILabel!
    @IBOutlet weak var hepB2DateLabel: UILabel!
    @IBOutlet weak var hepB2IncompleteBadge: UIImageView!
    @IBOutlet weak var hepB2CompleteBadge: UIImageView!
    @IBOutlet weak var hepB2CloseButton: UIButton!
    @IBOutlet weak var hepB2DatePickerLabel: UILabel!
    @IBOutlet weak var hepB2DatePickerButton: UIButton!
    @IBOutlet weak var hepB2CompleteButton: UIButton!
    var hepB2DateString: String!
    var hepB2OriginY: CGFloat!
    
    
    @IBOutlet weak var hepB3View: UIView!
    @IBOutlet weak var hepB3Button: UIButton!
    @IBOutlet weak var hepB3Label: UILabel!
    @IBOutlet weak var hepB3DateLabel: UILabel!
    @IBOutlet weak var hepB3IncompleteBadge: UIImageView!
    @IBOutlet weak var hepB3CompleteBadge: UIImageView!
    @IBOutlet weak var hepB3CloseButton: UIButton!
    @IBOutlet weak var hepB3DatePickerLabel: UILabel!
    @IBOutlet weak var hepB3DatePickerButton: UIButton!
    @IBOutlet weak var hepB3CompleteButton: UIButton!
    var hepB3DateString: String!
    var hepB3OriginY: CGFloat!

    
    var hepB1Complete:Bool = false
    var hepB2Complete:Bool = false
    var hepB3Complete:Bool = false
    
    var hepB1Open:Bool = false
    var hepB2Open:Bool = false
    var hepB3Open:Bool = false

    
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    

    @IBOutlet weak var moreAboutView: UIView!
    var moreAboutOriginY: CGFloat!
    
    var applyDatePickerTo: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 29/255, blue: 75/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        moreAboutOriginY = moreAboutView.frame.origin.y
        hepB2OriginY = hepB2View.frame.origin.y
        hepB3OriginY = hepB3View.frame.origin.y

        scrollView.delegate = self
        scrollView.contentSize.height = moreAboutView.frame.size.height + moreAboutOriginY + 60

        
        firstName.text = userFirstName! + "’s Progress"
        print(userFirstName! + "’s Progress")
        
        for button in [hepB1CloseButton, hepB2CloseButton, hepB3CloseButton] {
            button.hidden = true
        }
        
        for button in [hepB1DatePickerButton, hepB2DatePickerButton, hepB3DatePickerButton] {
            button.layer.cornerRadius = 8
        }
        
        for button in [hepB1View, hepB2View, hepB3View] {
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(red:204/255.0, green:214/255.0, blue:221/255.0, alpha: 1.0).CGColor
        }
        
        for button in [hepB1CompleteButton, hepB2CompleteButton, hepB3CompleteButton] {
            button.layer.cornerRadius = 8
        }
        
        showHideBadges()
        
        datePickerView.hidden = true
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }

    @IBAction func didPressHepB1(sender: AnyObject? = nil) {
        print(hepB1Open)
        if hepB1Open == false {
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.hepB1View.frame.size.height = 160
                self.hepB2View.frame.origin.y += 120
                self.hepB3View.frame.origin.y += 120
                self.moreAboutView.frame.origin.y += 120
                self.hepB1View.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
                self.hepB1DateLabel.hidden = true
                self.hepB1CloseButton.hidden = false
                self.hepB1Button.enabled = false
                }) { (Bool) -> Void in
                    self.hepB1Open = true
                    print(self.hepB1View.frame.size.height)
            }
        } else {
            print("time to close b1")
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.hepB1View.frame.size.height = 40
                self.hepB2View.frame.origin.y -= 120
                self.hepB3View.frame.origin.y -= 120
                self.moreAboutView.frame.origin.y -= 120
                self.hepB1DateLabel.hidden = false
                self.hepB1CloseButton.hidden = true
                self.hepB1Button.enabled = true
                }) { (Bool) -> Void in
                    self.hepB1Open = false
            }
        }
        showHideBadges()
    }
    
    @IBAction func didPressHepB2(sender: AnyObject? = nil) {
        print(hepB2Open)
        if hepB2Open == false {
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.hepB2View.frame.size.height = 160
                self.hepB3View.frame.origin.y += 120
                self.moreAboutView.frame.origin.y += 120
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
                self.hepB3View.frame.origin.y -= 120
                self.moreAboutView.frame.origin.y -= 120
                self.hepB2DateLabel.hidden = false
                self.hepB2CloseButton.hidden = true
                self.hepB2Button.enabled = true
                }) { (Bool) -> Void in
                    self.hepB2Open = false
            }
        }
        showHideBadges()
    }
    
    @IBAction func didPressHepB3(sender: AnyObject? = nil) {
        print(hepB3Open)
        if hepB3Open == false {
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.hepB3View.frame.size.height = 160
                self.moreAboutView.frame.origin.y += 120
                self.hepB3View.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
                self.hepB3DateLabel.hidden = true
                self.hepB3CloseButton.hidden = false
                self.hepB3Button.enabled = false
                }) { (Bool) -> Void in
                    self.hepB3Open = true
                    print(self.hepB3View.frame.size.height)
            }
        } else {
            print("time to close b3")
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.hepB3View.frame.size.height = 40
                self.moreAboutView.frame.origin.y -= 120
                self.hepB3DateLabel.hidden = false
                self.hepB3CloseButton.hidden = true
                self.hepB3Button.enabled = true
                }) { (Bool) -> Void in
                    self.hepB3Open = false
            }
        }
        showHideBadges()
    }
    
    
    @IBAction func didPressHepB1Complete(sender: AnyObject) {
        print(hepB1Date)
        if hepB1Date != nil{
            hepB1Complete = true
            didPressHepB1()
            hepB1Label.text = "Completed!"
            hepB1Label.textColor = UIColor(red:57/255.0, green:223/255.0, blue:183/255.0, alpha: 1.0)
            hepB1View.layer.borderColor = UIColor(red:57/255.0, green:223/255.0, blue:183/255.0, alpha: 1.0).CGColor
            hepB1View.layer.backgroundColor = UIColor
                .whiteColor().CGColor
            hepB1DateLabel.text = hepB1DateString
        }
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
    @IBAction func didPressHepB3Complete(sender: AnyObject) {
        print(hepB3Date)
        if hepB3Date != nil{
            hepB3Complete = true
            didPressHepB3()
            hepB3Label.text = "Completed!"
            hepB3Label.textColor = UIColor(red:57/255.0, green:223/255.0, blue:183/255.0, alpha: 1.0)
            hepB3View.layer.borderColor = UIColor(red:57/255.0, green:223/255.0, blue:183/255.0, alpha: 1.0).CGColor
            hepB3View.layer.backgroundColor = UIColor
                .whiteColor().CGColor
            hepB3DateLabel.text = hepB3DateString
        }
    }
    
    
    @IBAction func didPressHepB1Close(sender: AnyObject) {
        didPressHepB1()
    }
    
    
    @IBAction func didPressHepB2Close(sender: AnyObject) {
        didPressHepB2()
    }
    
    
    @IBAction func didPressHepB3Close(sender: AnyObject) {
        didPressHepB3()
    }
    
    
    
    
    
    // SHOT DATE PICKER ------------------------------------------------------------------
    
    // on press of shotdate
    @IBAction func didPressDatePicker(sender: AnyObject) {
        applyDatePickerTo = sender.tag
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        datePickerView.frame.origin.y = screenSize.height - 260
        
        datePickerView.hidden = false
        print(applyDatePickerTo)
        scrollView.scrollEnabled = false
    }
    
    // on select of date
    func datePickerChanged(datePicker:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        switch applyDatePickerTo {
            
        case 1:
            hepB1Date = datePicker.date
            
            hepB1DateString = dateFormatter.stringFromDate(datePicker.date)
            
            hepB1DatePickerLabel.text = hepB1DateString
            hepB1DatePickerLabel.textColor = UIColor(red: 3.0/255, green: 3.0/255, blue: 3.0/255, alpha: 1.0)
            print(hepB1Date)
            print(hepB1DateString)
            
        case 2:
            hepB2Date = datePicker.date
            
            hepB2DateString = dateFormatter.stringFromDate(datePicker.date)
            
            hepB2DatePickerLabel.text = hepB2DateString
            
            hepB2DatePickerLabel.textColor = UIColor(red: 3.0/255, green: 3.0/255, blue: 3.0/255, alpha: 1.0)
            print(hepB2Date)
            print(hepB2DateString)
            
        case 3:
            hepB3Date = datePicker.date
            
            hepB3DateString = dateFormatter.stringFromDate(datePicker.date)
            
            hepB3DatePickerLabel.text = hepB3DateString
            
            hepB3DatePickerLabel.textColor = UIColor(red: 3.0/255, green: 3.0/255, blue: 3.0/255, alpha: 1.0)
            print(hepB3Date)
            print(hepB3DateString)
            
        default: break
            //println("default")
        }
        
        

    }
    
    // on press of done date picker
    @IBAction func didPressDatePickerDone(sender: UIButton) {
        datePickerView.hidden = true
        scrollView.scrollEnabled = true

    }
    
    
    @IBAction func didPressCDCLink(sender: AnyObject) {
        
    }
    
    @IBAction func onBack(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    func showHideBadges() {
        
        if hepB1Complete == true {
            hepB1IncompleteBadge.hidden = true
            hepB1CompleteBadge.hidden = false
        } else {
            hepB1IncompleteBadge.hidden = false
            hepB1CompleteBadge.hidden = true
        }
        
        if hepB2Complete == true {
            hepB2IncompleteBadge.hidden = true
            hepB2CompleteBadge.hidden = false
        } else {
            hepB2IncompleteBadge.hidden = false
            hepB2CompleteBadge.hidden = true
        }

        if hepB3Complete == true {
            hepB3IncompleteBadge.hidden = true
            hepB3CompleteBadge.hidden = false
        } else {
            hepB3IncompleteBadge.hidden = false
            hepB3CompleteBadge.hidden = true
        }
        
        
    }
    
    
    
    
    
    
}