//
//  ContentsInfo.swift
//  TrachtenbergMaths
//
//  Created by Deb Santa Clara on 1/03/20.
//  Copyright © 2020 Deb Santa Clara. All rights reserved.
//

import Foundation

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
    
//    func instructionSteps() -> InstructionsStruct{
//
//    }
}

struct InstructionsStruct {
    var heading: String
    var instruction: String
}

let elevenInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Bring right-most digit down to right-most position in answer."),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Add the digit to its right hand neighbour, plus anything carried over."),
    InstructionsStruct(heading: "Last Step: ", instruction: "Bring left-most digit down, add anything carried over.")]

let twelveInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Doubld the right-most digit, bring it down to right-most position in answer."),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "For the rest of the digits, double the digit, and add to right hand neighbour, plus anything carried over."),
    InstructionsStruct(heading: "Last Step: ", instruction: "Bring left-most digit down, add anything carried over.")
]

let sixInstructions = [
    InstructionsStruct(heading: "First Step: ", instruction: "Doubld the right-most digit, bring it down to right-most position in answer."),
    InstructionsStruct(heading: "Middle Steps: ", instruction: "Add \'half\' the righthand neighbour)"),
    InstructionsStruct(heading: "Last Step: ", instruction: "Bring left-most digit down, add anything carried over.")
]


//let arrayInstructions = [elevenInstructions]

//https://factrepublic.com/facts/7212/
