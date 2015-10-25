//
//  AddUserViewController.swift
//  Immunizations
//
//  Created by James Taylor on 10/24/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {
    
    // add photo
    @IBOutlet weak var didPressAddPhoto: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerContainer: UIView!
    
    // text inputs
    @IBOutlet weak var firstNameTextFieldBG: UIView!
    @IBOutlet weak var middleInitialTextField: UIView!
    @IBOutlet weak var lastNameTextField: UIView!

    
    @IBOutlet weak var remindMeButton: UIButton!
    
    @IBOutlet weak var datePickerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerContainer.hidden = true
        
        
        // round corners on input fields
        firstNameTextFieldBG.layer.cornerRadius = 8
        middleInitialTextField.layer.cornerRadius = 8
        lastNameTextField.layer.cornerRadius = 8

        
        
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        datePickerView.addSubview(blurEffectView)
        
        
    }

    
    
    func datePickerChanged(datePicker:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        dateLabel.text = strDate
    }
    
    
    
    
    
    @IBAction func didPressRemindMe(sender: UIButton) {
        remindMeButton.selected = !remindMeButton.selected
    }
    
    
    
    @IBAction func didPressAddPhoto(sender: UIButton) {
        print("add photo button pressed")
    }
    

    
    @IBAction func didPressNext(sender: UIButton) {
        print("next button pressed")
        // consider enabled/disabled state for next button based on fields being successfully input
    }
    
    
    
    @IBAction func didPressBirthdate(sender: UIButton) {
            datePickerContainer.hidden = false
    }
    
    
    @IBAction func didPressDatePickerDone(sender: UIButton) {
        datePickerContainer.hidden = true
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
