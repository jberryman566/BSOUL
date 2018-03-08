//
//  workoutViewController.swift
//  BSOUL
//
//  Created by  Joshua W Berryman on 2018-02-28.
//  Copyright © 2018  Joshua W Berryman. All rights reserved.
//

import UIKit

class workoutViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var excerciseLabel: UILabel!
    @IBOutlet weak var excerciseQuantity: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    
    let excercises = ["Push Ups", "Sit Ups", "Jumping Jacks", "Squats", "Lunges"]
    
    var seconds = 60
    var timeClock = Timer()
    let isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        pickExcercise()
        pickQuantity()
        
        seconds = 60
        timer.text = String(seconds)
        runTimer()
        // Do any additional setup after loading the view.
        
        workoutImage.image = UIImage(named: "motivation")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timer.text = String(seconds) //This will update the label.
        
        // Stop the clock at 0
        if (seconds == 0) {
            timeClock.invalidate()
        }
    }
    func runTimer() {
        timeClock = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(workoutViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    //Set a random Excercise
    func pickExcercise() {
        
        let randomIndex = Int(arc4random_uniform(UInt32(excercises.count)))
        // Get a random item
        let randomItem = excercises[randomIndex]
        excerciseLabel.text = randomItem
        
    }
    
    //set the quantity of excercise
    func pickQuantity() {
        
        let defaults = UserDefaults.standard
        let level = defaults.integer(forKey: "Level")
        let excerciseDefault = 5
        
        var quantity = excerciseDefault + ((level - 1) * 2)
        //set a max amount reasonable for a human
        if (quantity > 50) {
            quantity = 50
        }
        excerciseQuantity.text = String(quantity)
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
