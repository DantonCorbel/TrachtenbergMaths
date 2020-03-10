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
    var toggleCarry = true
    var givenAnswer = ""
    var numberTimesNumberButtonPressed = 0
    var undoArray = [Undo]()
    

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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
//IBAction
    @IBAction func hintTaped(_ sender: UITapGestureRecognizer) {
        let boldText = "Summary "
        let normalText = multiplier.summarySteps
        
        let attributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attributes)
        
        let normalString = NSMutableAttributedString(string:normalText)
        
        attributedString.append(normalString)
        instructionsLabel.attributedText = attributedString
    }
    
    
    @IBAction func UISegmentedControlTapped(_ sender: UISegmentedControl) {
        segmentedControlChoice()
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        undoButton.isEnabled = true
        clearButton.isEnabled = true
        let number = sender.title (for: .normal)
        if toggleCarry {
            for i in (0..<answerLabels.count).reversed() {
                if answerLabels[i].text == "?" {
                    answerLabels[i].text = number
                    getGivenAnswer(number: number!)
                    numberTimesNumberButtonPressed += 1
                    undoArray.append(.number)
                    print(givenAnswer, undoArray, numberTimesNumberButtonPressed)
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
                    carryLabels[i].textColor = UIColor.red
                    carryLabels[i].isEnabled = true
                    toggleCarryButton()
                    undoArray.append(.carry)
                    break
                }
            }
        }
        
        segmentedControlChoice()
    }
    
    @IBAction func carryButtonPressed(_ sender: Any) {
        toggleCarryButton()
    }
 
    @IBAction func undoButtonPressed(_ sender: Any) {
        undo(cases: undoArray.popLast()!)
       
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        resetView()
    }
    
    @IBAction func checkButtonPressed(_ sender: Any) {
        if givenAnswer == String(answer) {
            instructionsLabel.text = "Correct! Try another or practice?"
            //instructionsLabel.textColor = UIColor.green
            nextButton.isEnabled = true
        } else {
            instructionsLabel.text = "Oops! The answer was \(answer). Keep trying"
            //instructionsLabel.textColor = UIColor.orange
            nextButton.isEnabled = true
        }
        print(givenAnswer, answer)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        multiplicandArray = ["0", "0"]
        answer = 0
        toggleCarry = true
        undoArray = [Undo]()
        givenAnswer = ""
        numberTimesNumberButtonPressed = 0
        loadNewMultiplicandData()
        resetView()
        
    }
    
//GENERAL FUNCTIONS
    
    //func segmentControl
    func segmentedControlChoice() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            learnInstructions(multiplier: multiplier)
        case 1:
            instructionsLabel.text = "Hint?"
            instructionsLabel.isUserInteractionEnabled = true
        case 2:
            instructionsLabel.text = ""
        default:
            learnInstructions(multiplier: multiplier)
        }
    }
    
    //Undo function
    func undo(cases: Undo) {
       // let caseRequired = undoArray.popLast()!
       
        switch cases {
        case .carry:
            for i in 0..<carryLabels.count {
                if carryLabels[i] .text != "0" {
                    carryLabels[i].text = "0"
                    carryLabels[i].isEnabled = false
                    carryLabels[i].textColor = UIColor.black
                    break
                }
             
            }
        case .number:
            if numberTimesNumberButtonPressed > 0 {
                answerLabels[5-numberTimesNumberButtonPressed].text = "?"
                if numberTimesNumberButtonPressed < 5 {
                    if answerLabels[5-numberTimesNumberButtonPressed-1].text == "?" {
                       answerLabels[5-numberTimesNumberButtonPressed-1].isEnabled = false
                        answerLabels[5-numberTimesNumberButtonPressed-1].text = "0"
                    }
                }
                numberTimesNumberButtonPressed -= 1
                if numberTimesNumberButtonPressed == 0 {
                        resetView()
                }
                givenAnswer = String(givenAnswer.suffix(numberTimesNumberButtonPressed))
                print(givenAnswer)
                if checkButton.isEnabled {
                    for i in 0..<keyboardNumbersButtons.count {
                        keyboardNumbersButtons[i].isEnabled = true
                    }
                    carryButton.isEnabled = true
                    checkButton.isEnabled = false
                }
            }
            segmentedControlChoice()
        }
    }
    
    
    //Get given answer Int
    func getGivenAnswer(number: String) {
        
        if numberTimesNumberButtonPressed == 0 {
            givenAnswer = number
        } else {
            givenAnswer = number + givenAnswer
        }
        if givenAnswer.count == String(answer).count {
            for i in 0..<keyboardNumbersButtons.count {
                keyboardNumbersButtons[i].isEnabled = false
            }
        carryButton.isEnabled = false
        checkButton.isEnabled = true
        }
    }
    
    
    
    //toggle carry button
    func toggleCarryButton() {
        if toggleCarry {
            carryButton.isSelected = true
            toggleCarry = false
        } else {
            carryButton.isSelected = false
            toggleCarry = true
        }
    }
    
    
    //get instruction into attributed text
    func learnInstructions(multiplier: BasicMultiplicationMultiplier) {
        instructionsLabel.isUserInteractionEnabled = false
        var boldText = ""
        var normalText = ""
        
        if givenAnswer.count == String(answer).count {
            checkButton.isEnabled = true
            boldText = ""
            normalText = ""

        } else if numberTimesNumberButtonPressed == 0 {
            boldText = multiplier.instructionsSteps[0].heading
            normalText = multiplier.instructionsSteps[0].instruction
        } else if numberTimesNumberButtonPressed <= 2 {
            boldText = multiplier.instructionsSteps[1].heading
            normalText = multiplier.instructionsSteps[1].instruction
        } else if numberTimesNumberButtonPressed == 3 {
            boldText = multiplier.instructionsSteps[2].heading
            normalText = multiplier.instructionsSteps[2].instruction
        } else {
            boldText = "Final step: "
            normalText = "Place carried number in left-most spot."
        }
    
        
        let attributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attributes)
        
        let normalString = NSMutableAttributedString(string:normalText)
        
    
        attributedString.append(normalString)
        instructionsLabel.attributedText = attributedString
        
    }
    
    //practice instructions
    
    
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
        givenAnswer = ""
        undoArray = [Undo]()
        instructionsLabel.textColor = UIColor.black
        numberTimesNumberButtonPressed = 0
        
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
        segmentedControlChoice()
    }
    
    func loadNewMultiplicandData() {
        multiplicand = randomNumber()
        //multiplicand = 999
        multiplicandArrayFunc(number: multiplicand)
        placeMultiplierLabels(array: multiplicandArray)
        ChooseNumberOfZerosToShow(multiplier: multiplier, multiplicand: multiplicand)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        multiplierLabel.text = multiplier.multiplierString
        multiplyByLabel.text = "Multiply by \(multiplier.multiplierString)"
        for i in 0..<buttonLabels.count {
            let button = buttonLabels[i]
            button.backgroundColor = .clear
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }
        loadNewMultiplicandData()
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
