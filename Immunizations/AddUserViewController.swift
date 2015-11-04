//
//  AddUserViewController.swift
//  Booster
//
//  Created by James Taylor on 10/24/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit


// NOTE: GLOBAL VARIABLES DEFINED IN GLOBAL.SWIFT

class AddUserViewController: UIViewController, UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    // scroll view
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // photo picker
    @IBOutlet weak var didPressAddPhoto: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    let imagePicker = UIImagePickerController()
//--TO CONSIDER: IMPLENTING OPTION TO TAKE PHOTO VS. CHOOSE IMAGE

    // name text fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var firstNameTextFieldBG: UIView!
    @IBOutlet weak var middleInitialTextField: UITextField!
    @IBOutlet weak var middleInitialTextFieldBG: UIView!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var lastNameTextFieldBG: UIView!
    
    // birthdate date picker
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerContainer: UIView!
    @IBOutlet weak var birthdateButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!

    // sex picker
    @IBOutlet weak var sexPicker: UIPickerView!
    @IBOutlet weak var sexPickerContainer: UIView!
    @IBOutlet weak var sexButton: UIButton!
    @IBOutlet weak var sexLabel: UILabel!
    var sexData: [String] = [String]()

    // remind me notification toggle
    @IBOutlet weak var remindMeButton: UIButton!
    
    // create record button
    @IBOutlet weak var createButton: UIButton!
   
    // move content up when keyboard appears
    var initialY: CGFloat!
    let offset: CGFloat = -150
    
    
    


    
// VIEW DID LOAD ------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // prep scrollable area
        scrollView.contentSize = contentView.frame.size;
        
        // prep image picker
        imagePicker.delegate = self
        
        // prep sex picker
        sexPicker.delegate = self
        sexPicker.dataSource = self
        sexData = ["F", "M"]
        userSex = "F" // set default in case user doesn't change input

        // mask photo as a circle
        photoImageView.layer.cornerRadius = photoImageView.frame.size.height/2
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.borderWidth = 0
        
        // round corners on input fields
        firstNameTextFieldBG.layer.cornerRadius = 8
        middleInitialTextFieldBG.layer.cornerRadius = 8
        lastNameTextFieldBG.layer.cornerRadius = 8
        birthdateButton.layer.cornerRadius  = 8
        sexButton.layer.cornerRadius = 8

        // hide date picker
        datePickerContainer.hidden = true
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        // hide sex picker
        sexPickerContainer.hidden = true
        
        // prep page scroll up when keyboard displays
        initialY = contentView.frame.origin.y
        
        // set listeners for when keyboard shows / hides
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // enable/disable create button
//        if firstNameTextField.text == "" || middleInitialTextField.text == "" || lastNameTextField.text == "" || dateLabel.text == "" || sexLabel.text == "" {
//                createButton.backgroundColor = UIColor.grayColor()
//        } else {
//            createButton.backgroundColor = UIColor.greenColor()
//        }
        
    }

    
    
    
    
// CUSTOM METHODS ------------------------------------------------------------------

    
    // PHOTO ------------------------------------------------------------------
    
    // on press add photo
    @IBAction func didPressAddPhoto(sender: UIButton) {
        // print("add photo button pressed")
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
        // change button label to edit
        didPressAddPhoto.setTitle("Edit Photo", forState: .Normal)
    }
    
    // set selected image
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        let selectedImage : UIImage = image
        photoImageView.image = selectedImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // hide choose image modal
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // BIRTHDATE ------------------------------------------------------------------
    
    // on press of birthdate
    @IBAction func didPressBirthdate(sender: UIButton) {
        sexPickerContainer.hidden = true
        datePickerContainer.hidden = false
        contentView.endEditing(true)
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            
            self.contentView.frame.origin = CGPoint(x: self.contentView.frame.origin.x, y: self.initialY + self.offset)
            
            }) { (Bool) -> Void in
        }
    }
    
    // on select of date
    func datePickerChanged(datePicker:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        userBirthDate = datePicker.date
        hepB2Date = NSCalendar.currentCalendar().dateByAddingUnit(
            .Day,
            value: 60,
            toDate: userBirthDate!,
            options: NSCalendarOptions(rawValue: 0))!
        
        //print("userBirthDate is \(userBirthDate)")
        //print("hepBShot2 due date is \(hepBShot2Date)")
        userBirthDateString = dateFormatter.stringFromDate(datePicker.date)
        dateLabel.text = userBirthDateString
        dateLabel.textColor = UIColor(red: 3.0/255, green: 3.0/255, blue: 3.0/255, alpha: 1.0)

    }

    // on press of done date picker
    @IBAction func didPressDatePickerDone(sender: UIButton) {
        datePickerChanged(datePicker)
        datePickerContainer.hidden = true
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.contentView.frame.origin = CGPoint(x: self.contentView.frame.origin.x, y: self.initialY)
            }) { (Bool) -> Void in
        }
        dateLabel.text = userBirthDateString
        dateLabel.textColor = UIColor(red: 3.0/255, green: 3.0/255, blue: 3.0/255, alpha: 1.0)

    }
    
    
    // SEX PICKER ------------------------------------------------------------------
    
//--TO IMPLEMENT
    // on press of sex
    @IBAction func didPressSex(sender: UIButton) {
        datePickerContainer.hidden = true
        sexPickerContainer.hidden = false
        contentView.endEditing(true)
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            
            self.contentView.frame.origin = CGPoint(x: self.contentView.frame.origin.x, y: self.initialY + self.offset)
            
            }) { (Bool) -> Void in
        }
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sexData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sexData[row]
    }
    
    // Capture the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        userSex = sexData[row]
        sexLabel.text = userSex
        sexLabel.textColor = UIColor(red: 3.0/255, green: 3.0/255, blue: 3.0/255, alpha: 1.0)
    }
    
    // on press of done sex picker
    @IBAction func didPressSexPickerDone(sender: UIButton) {
        
        sexPickerContainer.hidden = true
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.contentView.frame.origin = CGPoint(x: self.contentView.frame.origin.x, y: self.initialY)
            }) { (Bool) -> Void in
                
        }
        sexLabel.text = userSex
        sexLabel.textColor = UIColor(red: 3.0/255, green: 3.0/255, blue: 3.0/255, alpha: 1.0)
    }
    
    
    
    
    
    // REMIND ME ------------------------------------------------------------------
    
    // on press of remind me
    @IBAction func didPressRemindMe(sender: UIButton) {
        remindMeButton.selected = !remindMeButton.selected
        userReceiveReminders = !userReceiveReminders
        //print(userReceiveReminders)
    }
    
    

    // NEXT (FINISH) ------------------------------------------------------------------

    @IBAction func didPressCreateRecord(sender: AnyObject) {
        //print("next button pressed")
        // consider enabled/disabled state for next button based on fields being successfully input
//        if firstNameTextField.text != "" && middleInitialTextField.text != ""  && lastNameTextField.text != ""  && dateLabel.text != ""  && sexLabel.text != "" {
//            performSegueWithIdentifier("CreateRecord", sender: nil)
//            
//            // set global variables for use on subsequent screens
//            userFirstName = firstNameTextField.text
//            userMiddleInitial = middleInitialTextField.text
//            userLastName = lastNameTextField.text
//            userBirthDateString = dateLabel.text
//            userPhotoImage = photoImageView.image
        if firstNameTextField.text != "asdfasfd" {
                performSegueWithIdentifier("CreateRecord", sender: nil)
                
                // set global variables for use on subsequent screens
                userFirstName = firstNameTextField.text
                userMiddleInitial = middleInitialTextField.text
                userLastName = lastNameTextField.text
                userBirthDateString = dateLabel.text
                userPhotoImage = photoImageView.image
        
        } else {
            
            let alertView = UIAlertController(title: "Please Complete All Info", message: "", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                
                // ...
                
            }
            alertView.addAction(okAction)

            self.presentViewController(alertView, animated: true) {
                // ...
            }
            
        }

    }
    
    
    
    // MOVE CONTENT UP WHEN KEYBOARD SHOWING
    func moveContentUp() {
        self.contentView.frame.origin = CGPoint(x: self.contentView.frame.origin.x, y: self.initialY + self.offset)
    }
    func moveContentToOrigin() {
        sexPickerContainer.hidden = true
        datePickerContainer.hidden = true
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.contentView.frame.origin = CGPoint(x: self.contentView.frame.origin.x, y: self.initialY)

            }) { (Bool) -> Void in
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        moveContentUp()
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        moveContentToOrigin()
    }
    
    
    @IBAction func didPressBackground(sender: AnyObject) {
        contentView.endEditing(true)
        moveContentToOrigin()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
