//
//  surrenderViewController.swift
//  BSOUL
//
//  Created by  Joshua W Berryman on 2018-03-01.
//  Copyright © 2018  Joshua W Berryman. All rights reserved.
//

import UIKit

class surrenderViewController: UIViewController {

    @IBOutlet weak var bsoulPoints: UILabel!
    @IBOutlet weak var surrenderImage: UIImageView!
    
    //retrieve game data, update it and save it
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        surrenderImage.image = UIImage(named: "failure")
        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        var XP = defaults.integer(forKey: "XP")
        var level = defaults.integer(forKey: "Level")
        var XPneeded = defaults.integer(forKey: "XPneeded")
        var oldCap = defaults.integer(forKey: "oldCap")
        XP = XP + 10
        
        if (XP >= XPneeded) {
            
            level += 1
            let extraXP = (level - 1) * 50
            oldCap = XPneeded
            XPneeded = (level * 100) + extraXP
            
            defaults.set(level, forKey: "Level")
            defaults.set(XPneeded, forKey: "XPneeded")
            defaults.set(oldCap, forKey: "oldCap")
        }
        defaults.set(XP, forKey: "XP")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
