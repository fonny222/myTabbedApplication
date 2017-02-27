//
//  WorkoutSelectorViewController.swift
//  myTabbedApplication
//
//  Created by Christopher Fontana on 2/26/17.
//  Copyright © 2017 Christopher Fontana. All rights reserved.
//

import UIKit

class WorkoutSelectorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var workoutGen: UIPickerView!
    
    // needed for 2 components... I think...
    private let exerciseComponent = 0
    private let repsComponent = 1
    
    let exercise = ["Push Up","Crunches","Squats","Lunges","Dips","Jumping Jacks","Burpees"]
    let reps = ["5","10","15","20","25","30"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // do any additional setup after loading the view
        arc4random_stir()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        // looping for each component not element in array
        // if you have 4 components in spinner loop would be <4
        for i in 0..<2{
            // random number based on exercise array
          let newValueExercise = Int(arc4random_uniform(UInt32((exercise.count))))
            //let newValueReps = Int(arc4random_uniform(UInt32(reps.count)))
            
            // reloads the spinner with random exercise
            workoutGen.selectRow(newValueExercise, inComponent: i, animated: true)
            workoutGen.reloadComponent(i)
        }
    }

    //MARK:-
    //MARK: Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int{
        // this populates the picker with the two arrays
        if component == exerciseComponent{
            return exercise.count
        }else{
            return reps.count
        }
    }
    
    //MARK:-
    //MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        // this delegates the arrays... in some way i'm not sure
        if component == exerciseComponent{
            return exercise[row]
        }else{
            return reps[row]
        }
    }
}
