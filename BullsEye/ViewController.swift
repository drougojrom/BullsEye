//
//  ViewController.swift
//  BullsEye
//
//  Created by Roman Ustiantcev on 14/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    
    // MARK : var and let
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    
    // MARK: func's
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
    }
    
    
    // MARK : @IBActions

    @IBAction func showAlert(sender: UIButton) {
        
        var difference: Int
        
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if currentValue < targetValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        
        let message = "The value of slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nThe difference is \(difference)"
        
        let alert = UIAlertController(title: "Hello!", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    // MARK: override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
        updateLabels()
        
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        
    }


}

