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
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    
    // MARK : @IBActions

    @IBAction func showAlert(sender: UIButton) {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let titleValue : String
        score += points
        
        switch difference {
        case 0:
            titleValue = "perfect"
            points += 100
        case 0..<5:
            titleValue = "just almost had it!"
            points += 50
        case 5..<10:
            titleValue = "pretty good!"
        default:
            titleValue = "not even close :( "
        }
        
        let message = "You scored \(points)"
        
//        let message = "The value of slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nThe difference is \(difference)"
        
        let alert = UIAlertController(title: titleValue, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Ok", style: .Default, handler: { action in
                self.startNewRound()
                self.updateLabels()
        })
        
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
        startNewGame()
        
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
        
    }

    @IBAction func startOver(sender: UIButton) {
        
        startNewGame()
        
    }

}

