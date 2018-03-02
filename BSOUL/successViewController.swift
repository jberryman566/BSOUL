//
//  successViewController.swift
//  BSOUL
//
//  Created by  Joshua W Berryman on 2018-03-01.
//  Copyright © 2018  Joshua W Berryman. All rights reserved.
//

import UIKit

class successViewController: UIViewController {

    @IBOutlet weak var bsoulPoints: UILabel!
    @IBOutlet weak var successImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        successImage.image = UIImage(named: "success")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
