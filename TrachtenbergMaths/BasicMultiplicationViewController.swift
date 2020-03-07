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
    var multiplicand: Int!
    var multiplicandArray = ["0", "0"]
    var answer = 0
    var toggleKeyColour = true

    @IBOutlet weak var multiplyByLabel: UILabel!
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet var multiplicandLabels: [UILabel]!
    @IBOutlet var carryLabels: [UILabel]!
    @IBOutlet var answerLabels: [UILabel]!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet var keyboardNumbersButtons: [UIButton]!
    @IBOutlet var buttonLabels: [UIButton]!
    @IBOutlet weak var carryButton: UIButton!
    
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let number = sender.title (for: .normal)
        if toggleKeyColour {
            for i in (0..<answerLabels.count).reversed() {
                if answerLabels[i].text == "?" {
                    answerLabels[i].text = number
                    if i == 0 {break}
                    answerLabels[i-1].text = "?"
                    answerLabels[i-1].isEnabled = true
                    break
                }
            }
        } else {
            for i in 0..<carryLabels.count {
                if answerLabels[i].isEnabled {
                    carryLabels[i].text = number
                    carryLabels[i].tintColor = UIColor.red
                    carryLabels[i].isEnabled = true
                    toggleCarryButton()
                    break
                }
            }
        }
        
    }
    
    @IBAction func carryButtonPressed(_ sender: Any) {
        
        toggleCarryButton()
    }
    
    //toggle carry button
    func toggleCarryButton() {
        if toggleKeyColour {
            carryButton.isSelected = true
            toggleKeyColour = false
        } else {
            carryButton.isSelected = false
            toggleKeyColour = true
        }
    }
    
    
    //get instruction into attributed text
    func instructions () {
        let boldText = "\(elevenInstructions[0].heading)"
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalText = "\(elevenInstructions[1].instruction)"
        let normalString = NSMutableAttributedString(string:normalText)
        
        attributedString.append(normalString)
        instructionsLabel.attributedText = attributedString
    }
    
    //get random number to make multiplicand
    func randomNumber() -> Int {
        let num = Int.random(in: 111...999)
        return num
    }
    
    //get random number into an array in order to place it in the labels
    func multiplicandArrayFunc(number: Int) {
        let string = String(number)
        for letter in string {
            multiplicandArray.append(String(letter))
        }
    }
    
    func placeMultiplierLabels(array:Array<String>){
        for index in 0..<array.count {
            multiplicandLabels?[index].text = multiplicandArray[index]
        }
    }
    
    func ChooseNumberOfZerosToShow(multiplier: BasicMultiplicationMultiplier, multiplicand: Int) {
        answer = multiplier.multiplierInteger * multiplicand
        if String(answer).count == 3 {
            for i in 0...1 {
                multiplicandLabels[i].isHidden = true
                answerLabels[i].isHidden = true
                carryLabels[i].isHidden = true
            }

        } else if String(answer).count == 4 {
            multiplicandLabels[0].isHidden = true
            answerLabels[0].isHidden = true
            carryLabels[0].isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multiplierLabel.text = multiplier.multiplierString
        multiplyByLabel.text = "Multiply by \(multiplier.multiplierString)"
        multiplicand = randomNumber()
        multiplicandArrayFunc(number: multiplicand)
        placeMultiplierLabels(array: multiplicandArray)
        ChooseNumberOfZerosToShow(multiplier: multiplier, multiplicand: multiplicand)
        instructions()
        for i in 0..<buttonLabels.count {
            let button = buttonLabels[i]
            button.backgroundColor = .clear
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
    }

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
