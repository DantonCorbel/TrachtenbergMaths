//
//  IntroViewController.swift
//  TrachtenbergMaths
//
//  Created by Deb Santa Clara on 2/03/20.
//  Copyright © 2020 Deb Santa Clara. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var IntroTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        headingLabel.text = "\nJacow Trachtenberg\n"
        IntroTextLabel.text = "Born .... ......\nJewish prisoner in Nazi concentration camp\nDeveloped this system in order to keep his mind sgile, with very little paper to use\n  \n  \n"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
