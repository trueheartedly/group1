//
//  AddUserViewController.swift
//  Immunizations
//
//  Created by James Taylor on 10/24/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit


// NOTE: GLOBAL VARIABLES DEFINED IN GLOBAL.SWIFT

class AddUserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // photo picker
    @IBOutlet weak var didPressAddPhoto: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    let imagePicker = UIImagePickerController()
//--TO CONSIDER: IMPLENTING OPTION TO TAKE PHOTO VS. CHOOSE IMAGE

    // date picker
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerContainer: UIView!
    
    // name text fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var firstNameTextFieldBG: UIView!
    @IBOutlet weak var middleInitialTextField: UITextField!
    @IBOutlet weak var middleInitialTextFieldBG: UIView!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var lastNameTextFieldBG: UIView!
    
    // birthdate date picker
    @IBOutlet weak var birthdateButton: UIButton!
    @IBOutlet weak var datePickerView: UIView!
    
    // sex picker
    @IBOutlet weak var sexButton: UIButton!
    
//    let sex = [
//        ["M","F"],
//    ]
    
    // remind me notification toggle
    @IBOutlet weak var remindMeButton: UIButton!
    
    


    
    
    
// VIEW DID LOAD ------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self


        // mask photo as a circle
        photoImageView.layer.cornerRadius = photoImageView.frame.size.height/2
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.borderWidth = 0
        
        // round corners on input fields
        firstNameTextFieldBG.layer.cornerRadius = 8
        middleInitialTextField.layer.cornerRadius = 8
        lastNameTextField.layer.cornerRadius = 8
        birthdateButton.layer.cornerRadius  = 8
        sexButton.layer.cornerRadius = 8

        // hide date picker
        datePickerContainer.hidden = true
    
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        // date picker blurring
// TO DO: MAKE BETTER
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        datePickerView.addSubview(blurEffectView)
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
    
    // on select of date
    func datePickerChanged(datePicker:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        dateLabel.text = strDate
    }

    // on press of birthdate
    @IBAction func didPressBirthdate(sender: UIButton) {
        datePickerContainer.hidden = false
    }
    
    // on press of done date picker
    @IBAction func didPressDatePickerDone(sender: UIButton) {
        datePickerContainer.hidden = true
    }
    
    
    // REMIND ME ------------------------------------------------------------------
    
//--TO IMPLEMENT
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //    func pickerView(sexPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return sex.count
    //    }
    
    
    
    // REMIND ME ------------------------------------------------------------------
    
    // on press of remind me
    @IBAction func didPressRemindMe(sender: UIButton) {
        remindMeButton.selected = !remindMeButton.selected
        userReceiveReminders = !userReceiveReminders
        print(userReceiveReminders)
    }
    
    

    // NEXT (FINISH) ------------------------------------------------------------------

    @IBAction func didPressNext(sender: UIButton) {
        print("next button pressed")
        // consider enabled/disabled state for next button based on fields being successfully input
        
        // set global variables for use on subsequent screens
        userFirstName = firstNameTextField.text
        userMiddleInitial = middleInitialTextField.text
        userLastName = lastNameTextField.text
        userBirthdate = dateLabel.text
        //userSex = sexLabel.text
        
// TO IMPLEMENT:
        //userPhotoImage = photoImageView.image
        
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
