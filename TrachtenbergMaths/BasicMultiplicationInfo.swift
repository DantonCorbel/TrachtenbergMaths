//
//  ContentsInfo.swift
//  TrachtenbergMaths
//
//  Created by Deb Santa Clara on 1/03/20.
//  Copyright © 2020 Deb Santa Clara. All rights reserved.
//

import Foundation

struct InstructionsStruct {
    var heading: String
    var instruction: String
}

let elevenInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Bring right-most digit down to right-most position in answer."),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Add the digit to its right hand neighbour, plus anything carried over."),
    InstructionsStruct(heading: "Last Step: ", instruction: "Bring left-most digit down, add anything carried over.")]

let twelveInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Double the right-most digit, bring it down to right-most position in answer."),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Double the digit, and add to right hand neighbour, plus anything carried over."),
    InstructionsStruct(heading: "Last Step: ", instruction: "Bring left-most digit down, add anything carried over.")
]

let sixInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Bring right-most digit down to right-most position in answer, unless it is an odd number first add 5."),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Add \'half\' (ignore decimals) of the righthand neighbour to the digit. If digit is odd, also add 5."),
    InstructionsStruct(heading: "Last Step: ", instruction: "Bring \'half\' left-most digit down, add anything carried over.")
]

let sevenInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Doubld the right-most digit, bring it down to right-most position in answer."),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Double the digit, add \'half\' (ignore decimals) the righthand neighbour. If digit is odd, also add 5"),
    InstructionsStruct(heading: "Last Step: ", instruction: "Bring \'half\'left-most digit down, add anything carried over.")
]

let fiveInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "If the right-most digit is even, bring 0 down to right-most position in answer. If it is odd, use 5"),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "If the digit is even, use \'half\' (ignore decimals) the right-hand neighbour. If it is odd, add 5 to \'half\' the right-hand neighbour"),
    InstructionsStruct(heading: "Last Step: ", instruction: "Bring \'half\'left-most digit down, add anything carried over.")
]

let nineInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Subtract right-most digit from 10, and use in right-most answer position"),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Subtract digit from 9, add the right-hand neighbour."),
    InstructionsStruct(heading: "Last Step: ", instruction: "Subtract 1 from left-most digit, add anything carried over.")
]

let eightInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Subtract right-most digit from 10, then double the answer, use in right-most answer position"),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Subtract digit from 9, double the answer, then add the right-hand neighbour."),
    InstructionsStruct(heading: "Last Step: ", instruction: "Subtract 2 from left-most digit, add anything carried over.")
]

let fourInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Subtract right-most digit from 10, if digit was odd then add 5 to answer, and use in right-most answer position"),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Subtract digit from 9, if digit was odd then add 5 to answer, add \'half\' the right-hand neighbour."),
    InstructionsStruct(heading: "Last Step: ", instruction: "Subtract 1 from \'half\' the nighbour, add anything carried over.")
]

let threeInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Subtract right-most digit from 10 and double the answer, if digit was odd then also add 5, and use in right-most answer position"),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Subtract digit from 9 and double the answer, if digit was odd then also add 5, add \'half\' the right-hand neighbour."),
    InstructionsStruct(heading: "Last Step: ", instruction: "Take \'half\' of left-most digit, and subtrsct 2.")
]


enum BasicMultiplicationMultiplier {
    case eleven, twelve, nine, eight, seven, six, five, four, three
    
    var multiplierInteger: Int {
        switch self {
        case .twelve:
            return 12
        case .eleven:
            return 11
        case .nine:
            return 9
        case .eight:
            return 8
        case .seven:
            return 7
        case .six:
            return 6
        case .five:
            return 5
        case .four:
            return 4
        case .three:
            return 3
        }
    }
    
    var multiplierString: String {
        switch self {
        case .twelve:
            return "12"
        case .eleven:
            return "11"
        case .nine:
            return "9"
        case .eight:
            return "8"
        case .seven:
            return "7"
        case .six:
            return "6"
        case .five:
            return "5"
        case .four:
            return "4"
        case .three:
            return "3"
        }
    }
    
    var instructionsSteps: [InstructionsStruct] {
        switch self {
        case .twelve:
            return twelveInstructions
        case .eleven:
            return elevenInstructions
        case .nine:
            return nineInstructions
        case .eight:
            return eightInstructions
        case .seven:
            return sevenInstructions
        case .six:
            return sixInstructions
        case .five:
            return fiveInstructions
        case .four:
            return fourInstructions
        case .three:
            return threeInstructions
        }
    }
    
    var summarySteps: InstructionsStruct {
        switch self {
        case .twelve:
            return InstructionsStruct(heading: "Summary", instruction:  "Double the number, add the neighbour")
        case .eleven:
            return InstructionsStruct(heading: "Summary", instruction: "Add the neighbour")
        case .nine:
            return InstructionsStruct(heading: "Summary", instruction: """
First Step: Subtract from 10
Middle Step: Subtract from 9, add the neighbour
Last Step: Subtract 1 from left-most digit
""")
        case .eight:
            return InstructionsStruct(heading: "Summary", instruction: """
First Step: Subtract from 10, then double
Middle Step: Subtract from 9, double, add the neighbour
Last Step: Subtract 2 from left-most digit
""")
        case .seven:
            return InstructionsStruct(heading: "Summary", instruction: "Double the digit, add \'half\' the neighbour. If digit is odd, add 5.")
        case .six:
            return InstructionsStruct(heading: "Summary", instruction: "Add \'half\' the neighbour, if digit is odd, add 5.")
        case .five:
            return InstructionsStruct(heading: "Summary", instruction: "Use \'half\' the neighbour, if digit is odd, add 5.")
        case .four:
            return InstructionsStruct(heading: "Summary", instruction: """
First Step: Subtract from 10, if digit odd, add 5
Middle Step: Subtract from 9, add \'half\' the neighbour, then if digit odd add 5
Last Step: Take \'half\' of the left-most digit and subtract 1
""")
        case .three:
            return InstructionsStruct(heading: "Summary", instruction: """
First Step: Subtract from 10, double, if digit odd, add 5
Middle Step: Subtract from 9, double, add \'half\' the neighbour, then if digit odd add 5
Last Step: Take \'half\' of the left-most digit and subtract 2
""")
        }
    }
}

enum Undo {
    case number, carry
}



//info tab: explain half, explain odd and even numbers, explain carried number

//let arrayInstructions = [elevenInstructions]

//https://factrepublic.com/facts/7212/
