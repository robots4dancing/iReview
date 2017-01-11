//
//  ViewController.swift
//  iReview
//
//  Created by ANI on 1/11/17.
//  Copyright © 2017 Shane Empie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var restaurantNameLabel   :UILabel!
    @IBOutlet var recommendedLabel      :UILabel!
    @IBOutlet var userNameTextField     :UITextField!
    @IBOutlet var userReviewTextView    :UITextView!
    @IBOutlet var overallRatingSlider   :UISlider!
    @IBOutlet var foodRatingSegControl  :UISegmentedControl!
    @IBOutlet var serviceRatingStepper  :UIStepper!
    @IBOutlet var recommendedSwitch     :UISwitch!
    @IBOutlet var submitButton          :UIButton!
    
    //MARK: - Interactivity Methods
    
    @IBAction func pressed(button: UIButton) {
        guard let userName = userNameTextField.text else {
            return
        }
        guard let userReview = userReviewTextView.text else {
            return
        }
        print("Name: \(userName)")
        print("Would you recommend this to a friend: " + getRecommended(recommendedSwitch))
        print("Food Rating (0-5)⭐: " + getFoodRating(foodRatingSegControl))
        print("Service Rating (0-5)⭐: \(getServiceRating(serviceRatingStepper))⭐")
        print("Overall Rating (0-5)⭐: \(getOverallRating(overallRatingSlider))⭐")
        print("Review: \(userReview)")
        
    }
    
    @IBAction func valueChanged(rSwitch: UISwitch) {
        if rSwitch.isOn{
            recommendedLabel.text = "Yes"
        } else {
            recommendedLabel.text = "No"
        }
    }
    
    //MARK: - Get Values Methods
    
    func getRecommended(_ rSwitch: UISwitch) -> String {
        if rSwitch.isOn {
            return "Yes I would recommend this establishment"
        } else {
            return "No I would not recommend this establishment"
        }
    }
    
    func getFoodRating(_ segControl: UISegmentedControl) -> String {
        return segControl.titleForSegment(at: segControl.selectedSegmentIndex)!
    }
    
    func getServiceRating(_ stepper: UIStepper) -> Double {
        return stepper.value
    }
    
    func getOverallRating(_ slider: UISlider) -> Float {
        return slider.value
    }
    
    //MARK: - Text Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
    //MARK: - Life Cycle Methods
        
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendedSwitch.isOn = false
        valueChanged(rSwitch: recommendedSwitch)
        //overallRatingSlider.value = 0
        //foodRatingSegControl.selectedSegmentIndex = 0
        //serviceRatingStepper.value = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

