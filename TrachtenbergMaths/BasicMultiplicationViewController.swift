//
//  BasicMultiplicationViewController.swift
//  TrachtenbergMaths
//
//  Created by Deb Santa Clara on 3/03/20.
//  Copyright © 2020 Deb Santa Clara. All rights reserved.
//

import UIKit


class BasicMultiplicationViewController: UIViewController {
//Variables
    var multiplier: BasicMultiplicationMultiplier!
    var multiplicand: Int!
    var multiplicandArray = ["0", "0"]
    var answer = 0
    var toggleKeyColour = true
    var givenAnswer = 0

//IBOutlet
    @IBOutlet weak var multiplyByLabel: UILabel!
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet var multiplicandLabels: [UILabel]!
    @IBOutlet var carryLabels: [UILabel]!
    @IBOutlet var answerLabels: [UILabel]!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet var keyboardNumbersButtons: [UIButton]!
    @IBOutlet var buttonLabels: [UIButton]!
    @IBOutlet weak var carryButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
//IBAction
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        undoButton.isEnabled = true
        clearButton.isEnabled = true
        let number = sender.title (for: .normal)
        if toggleKeyColour {
            for i in (0..<answerLabels.count).reversed() {
                if answerLabels[i].text == "?" {
                    answerLabels[i].text = number
                    if i == 0 {break}
                    answerLabels[i-1].text = "?"
                    answerLabels[i-1].isEnabled = true
                    getGivenAnswer(number: number!)
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
        instructions(multiplier: multiplier)
    }
    
    @IBAction func carryButtonPressed(_ sender: Any) {
        toggleCarryButton()
    }
 
    @IBAction func undoButtonPressed(_ sender: Any) {
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        resetView()
    }
    
    @IBAction func checkButtonPressed(_ sender: Any) {
        if givenAnswer == answer {
            instructionsLabel.text = "Correct! Try another or practice?"
            instructionsLabel.textColor = UIColor.green
            nextButton.isEnabled = true
        } else {
            instructionsLabel.text = "Oops! The answer was \(answer). Keep trying"
            instructionsLabel.textColor = UIColor.orange
            nextButton.isEnabled = true
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    
//GENERAL FUNCTIONS
    //Get given answer Int
    func getGivenAnswer(number: String) {
        if String(givenAnswer).count == String(answer).count {
            for i in 0..<keyboardNumbersButtons.count {
                keyboardNumbersButtons[i].isEnabled = false
            }
        }else if givenAnswer == 0 {
            givenAnswer = Int(number)!
        } else {
            givenAnswer = Int(String(givenAnswer) + number) ?? 0
        }
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
    func instructions(multiplier: BasicMultiplicationMultiplier) {
        var boldText = ""
        var normalText = ""
        
        if String(givenAnswer).count == String(answer).count {
            checkButton.isEnabled = true
                boldText = ""
                normalText = ""
            
        } else if answerLabels[4].text == "?" {
                    boldText = multiplier.instructionsSteps[0].heading
                    normalText = multiplier.instructionsSteps[0].instruction
          } else if answerLabels[5-String(answer).count].text == "?" {
            boldText = multiplier.instructionsSteps[2].heading
            normalText = multiplier.instructionsSteps[2].instruction
          } else {
            boldText = multiplier.instructionsSteps[1].heading
            normalText = multiplier.instructionsSteps[1].instruction
        }
        
        
        let attributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attributes)
        
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
    
    func resetView() {
        givenAnswer = 0
        
        
        for i in 0..<keyboardNumbersButtons.count {
            keyboardNumbersButtons[i].isEnabled = true
        }
        carryButton.isEnabled = true
        undoButton.isEnabled = false
        clearButton.isEnabled = false
        checkButton.isEnabled = false
        nextButton.isEnabled = false
        
        for i in 0..<carryLabels.count {
            carryLabels[i].isEnabled = false
            carryLabels[i].textColor = UIColor.black
            carryLabels[i].text = "0"
        }
        
        for i in 0..<answerLabels.count {
            if i == answerLabels.count-1 {
                answerLabels[i].text = "?"
            } else {
                answerLabels[i].isEnabled = false
                answerLabels[i].text = "0"
            }
        }
        instructions(multiplier: multiplier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multiplicand = randomNumber()
        multiplicandArrayFunc(number: multiplicand)
        placeMultiplierLabels(array: multiplicandArray)
        ChooseNumberOfZerosToShow(multiplier: multiplier, multiplicand: multiplicand)
        multiplierLabel.text = multiplier.multiplierString
        multiplyByLabel.text = "Multiply by \(multiplier.multiplierString)"
        for i in 0..<buttonLabels.count {
            let button = buttonLabels[i]
            button.backgroundColor = .clear
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }
        resetView()

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
