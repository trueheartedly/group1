//
//  ShotTableViewCell.swift
//  Booster
//
//  Created by James Taylor on 11/1/15.
//  Copyright © 2015 Group 1. All rights reserved.
//

import UIKit

class ShotTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var shotView: UIView!
    @IBOutlet weak var shotButton: UIButton!
    @IBOutlet weak var shotDescriptionLabel: UILabel!
    @IBOutlet weak var shotCloseButton: UIButton!
    @IBOutlet weak var shotCompleteButton: UIButton!
    @IBOutlet weak var shotIndicatorCompleteImage: UIImageView!
    @IBOutlet weak var shotIndicatorIncompleteImage: UIImageView!
    @IBOutlet weak var shotDateLabel: UILabel!
    @IBOutlet weak var shotDatePickerDoneButton: UIButton!
    @IBOutlet weak var shotDatePickerLabel: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //
    //
    //
    //    @IBAction func didPressHepB2Complete(sender: AnyObject) {
    //        print(hepB2Date)
    //        if hepB2Date != nil{
    //            hepB2Complete = true
    //            didPressHepB2()
    //            hepB2Label.text = "Completed!"
    //            hepB2Label.textColor = UIColor(red:57/255.0, green:223/255.0, blue:183/255.0, alpha: 1.0)
    //            hepB2View.layer.borderColor = UIColor(red:57/255.0, green:223/255.0, blue:183/255.0, alpha: 1.0).CGColor
    //            hepB2View.layer.backgroundColor = UIColor
    //                .whiteColor().CGColor
    //            hepB2DateLabel.text = hepB2DateString
    //        }
    //    }
    //
    //
    //
    //    @IBAction func didPressHepB2Close(sender: AnyObject) {
    //        didPressHepB2()
    //    }
    //
    
    
    //
    //
    //    // SHOT DATE PICKER ------------------------------------------------------------------
    //
    //    // on press of shotdate
    //    @IBAction func didPressDatePicker(sender: AnyObject) {
    //        datePickerView.hidden = false
    //    }
    //
    //    // on select of date
    //    func datePickerChanged(datePicker:UIDatePicker) {
    //
    //        let dateFormatter = NSDateFormatter()
    //        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
    //        hepB2Date = datePicker.date
    //
    //        hepB2DateString = dateFormatter.stringFromDate(datePicker.date)
    //
    //        hepB2DatePickerLabel.text = hepB2DateString
    //
    //        hepB2DatePickerLabel.textColor = UIColor(red: 3.0/255, green: 3.0/255, blue: 3.0/255, alpha: 1.0)
    //        print(hepB2Date)
    //        print(hepB2DateString)
    //    }
    //
    //    // on press of done date picker
    //    @IBAction func didPressDatePickerDone(sender: UIButton) {
    //
    //        //datePickerChanged(datePicker)
    //        datePickerView.hidden = true
    //
    //    }

}
