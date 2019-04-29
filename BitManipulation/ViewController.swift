//
//  ViewController.swift
//  BitManipulation
//
//  Created by Preet on 2019-04-15.
//  Copyright © 2019 Preetinder Marok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstValue: UITextField!
    @IBOutlet weak var secondValue: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    var valueX: Int!
    var valueY: Int!
    
    var calculateBit = Calculate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculateButton.isEnabled = false
         updateCalculateButton()
    }

    @IBAction func firstTextFieldEditingChange(_ sender: Any) {
        if let x = firstValue.text {
            valueX = Int(x)
        }
        updateCalculateButton()
    }
    
    @IBAction func secondTextFieldEditingChange(_ sender: Any) {
        if let y = secondValue.text {
             valueY = Int(y)
        }
        updateCalculateButton()
    }
    func updateCalculateButton()  {
        calculateButton.isEnabled  = firstValue.hasText && secondValue.hasText ? true : false
        calculateButton.backgroundColor = calculateButton.isEnabled ? UIColor(red: 0, green: 100/255, blue: 0, alpha: 1) : UIColor.lightGray
        if calculateButton.isEnabled == false {
            resultLabel.text = "Result: "
        }
    }
   
    @IBAction func calculateTap(_ sender: Any) {
        if let x = firstValue.text,
            let y = secondValue.text {
            //force wrapping because values will never be nil at this point
            resultLabel.text = "Result: " + String(calculateBit.bitSwapCount(x: Int(x)!, y: Int(y)!))
        }
    }
}
