//
//  BasicMultiplicationViewController.swift
//  TrachtenbergMaths
//
//  Created by Deb Santa Clara on 3/03/20.
//  Copyright © 2020 Deb Santa Clara. All rights reserved.
//

import UIKit


class BasicMultiplicationViewController: UIViewController {
    var multiplier: BasicMultiplicationMultiplier!
    

    @IBOutlet weak var multiplyByLabel: UILabel!
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet weak var answerTenThouLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    
    
    func reset() {
        let boldText = "\(elevenInstructions[0].heading)"
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalText = "Instructions go here and may take up a few lines of text. So this placeholder needs to reflect that fact."
        let normalString = NSMutableAttributedString(string:normalText)
        
        attributedString.append(normalString)
        instructionsLabel.attributedText = attributedString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         multiplierLabel.text = multiplier.multiplierString
        multiplyByLabel.text = "Multiply by \(multiplier.multiplierString)"
        reset()

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
