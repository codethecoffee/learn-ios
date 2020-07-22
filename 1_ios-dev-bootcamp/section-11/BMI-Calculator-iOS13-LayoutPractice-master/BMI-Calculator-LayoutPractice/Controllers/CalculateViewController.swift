//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    // Create IBOutlet so you can access the values of the sliders
    // in calculateBMI function
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmi: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        print("Current height: " + String(format: "%.1f", sender.value))
        heightLabel.text = String(format: "%.1f", sender.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        print("Current weight: \(Int(sender.value))")
        weightLabel.text = String(Int(sender.value))
    }
    @IBAction func calculateBMIVal(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        bmi = weight / pow(height, 2)
        print(bmi)
        
        // Sender: The viewController initiating the transition
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    /**
     Function triggered whenever self.performSegue is called.
     This same function is called even if there are multiple different segues.

     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Make sure you are using the correct segue
        if segue.identifier == "goToResult" {
            
            // Downcast to ResultViewController in order to access
            // the property bmi that is unique to that subclass
            // The superclass UIViewController does not have it, thus
            // the code will not run if you don't downcast
            let destVC = segue.destination as! ResultViewController
            destVC.bmi = self.bmi
        }
        
        
    }
    

}

