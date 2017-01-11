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
    @IBOutlet var foodRatingLabel       :UILabel!
    @IBOutlet var serviceRatingLabel    :UILabel!
    @IBOutlet var overallRatingLabel    :UILabel!
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
        print("Food Rating (1-5)⭐: " + getFoodRating(foodRatingSegControl))
        print("Service Rating (1-5)⭐: \(getServiceRating(serviceRatingStepper))⭐")
        print("Overall Rating (1-5)⭐: \(getOverallRating(overallRatingSlider))⭐")
        print("Review: \(userReview)")
        
    }
    
    @IBAction func valueChanged(rSwitch: UISwitch) {
        if rSwitch.isOn{
            recommendedLabel.text = "Yes"
        } else {
            recommendedLabel.text = "No"
        }
    }
    
    @IBAction func valueChanged(segControl: UISegmentedControl) {
        foodRatingLabel.text = getFoodRating(segControl)
    }
    
    @IBAction func valueChanged(stepper: UIStepper) {
        serviceRatingLabel.text = "\(getServiceRating(stepper))⭐"
    }
    
    @IBAction func valueChanged(slider: UISlider) {
        overallRatingLabel.text = "\(getOverallRating(slider))⭐"
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
    
    func getServiceRating(_ stepper: UIStepper) -> Int {
        return Int(stepper.value)
    }
    
    func getOverallRating(_ slider: UISlider) -> Int {
        return Int(slider.value)
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
        overallRatingSlider.value = 1
        foodRatingSegControl.selectedSegmentIndex = 0
        serviceRatingStepper.value = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

