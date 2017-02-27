//
//  CaloriesBurnedViewController.swift
//  myTabbedApplication
//
//  Created by Christopher Fontana on 2/26/17.
//  Copyright © 2017 Christopher Fontana. All rights reserved.
//

import UIKit

class CaloriesBurnedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var genderPicker: UIPickerView!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var heartField: UITextField!
    
    @IBOutlet weak var minutesField: UITextField!
    
    
    let gender = ["Male","Female"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onButtonPressed(_ sender: Any) {
        
        // these to calculate the calories
        // first get the fields as a string and then convert them to a number
        // this is an optional that you must unwrap
        let age = Float(ageField.text!)
        let weight = Float(weightField.text!)
        let bPM = Float(heartField.text!)
        let minutes = Float(minutesField.text!)
        
        
        var ageWeight:Float = 0
        var heartNumber:Float = 0
        var caloriesBurned:Float = 0
        
        // these are constants used for calculating 
        // male
        let ageCalcM:Float = 0.2017
        let weightCalcM:Float = 0.09036
        let heartCalcM:Float = 0.6309
        let timeCalcM:Float = 4.184
        
        //female
        let ageCalcF:Float = 0.074
        let weightCalcF:Float = 0.05741
        let heartCalcF:Float = 0.4472
        let timeCalcF:Float = 4.184
        
        
        // use these to determine what was selected in the picker
        let row = genderPicker.selectedRow(inComponent: 0)
        let selected = gender[row]
        
        if (selected == "Male"){
            
            // male calculations
            ageWeight = ((age! * ageCalcM) - (weight! * weightCalcM))
            
            heartNumber = (ageWeight + (bPM! * heartCalcM) - 55.0969)
            
            caloriesBurned = (heartNumber * (minutes! / timeCalcM))
            
            
            // this is for the pop up message after button clicked
            // first the title is on the very top of the message
            let title = "\(selected): \(age!)"
            // this puts the message together title first, then the message below the title,
            let alert = UIAlertController (title: title, message: "Weight: \(weight!)lb's \r\n Heart Rate: \(bPM!)BPM \r\n You Burned: \(caloriesBurned) Calories", preferredStyle: .alert)
            // finally this creates the button to confirm message
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        if (selected == "Female"){
            
            // female calculations
            ageWeight = ((age! * ageCalcF) - (weight! * weightCalcF))
            
            heartNumber = (ageWeight + (bPM! * heartCalcF) - 20.4022)
            
            caloriesBurned = (heartNumber * (minutes! / timeCalcF))
            
            
            
            let title = "\(selected): \(age!)"
            let alert = UIAlertController (title: title, message: "Weight: \(weight!)lb's \r\n Heart Rate: \(bPM!)BPM \r\n You Burned: \(caloriesBurned) Calories", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
            
                    }
    }
    
    
    
   //MARK:-
    //MARK: Picker Data Source Methods
    // the first one tells how many components or spinning wheels in the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // this next one shows how many rows of data there are for a given component
    // we are using the size of the array as the number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        // .count method tells how many elements are in the array
        return gender.count
    }
    
    // this one applies the strings in the array 'gender' to the picker in the main storyboard
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return gender[row]
    }

}
