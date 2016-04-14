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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    // MARK : var and let
    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    // MARK: func's
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    // MARK : @IBActions

    @IBAction func showAlert(sender: UIButton) {
        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let message = "You scored \(points) points"
        
//        let message = "The value of slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nThe difference is \(difference)"
        
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

