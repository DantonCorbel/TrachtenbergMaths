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
    
    func instructionSteps() {
        
    }
}

struct instructionsStruct {
    var heading: String
    var instruction: String
}

let elevenInstructions = [
    instructionsStruct(heading: "Step 1: ", instruction: "Bring right-most digit down to right-most position in answer."),
    instructionsStruct(heading: "Step 2: ", instruction: "For the rest of the digits, add digit to right hand neighbour, plus anything carried over."),
    instructionsStruct(heading: "Step 3: ", instruction: "Bring left-most digit down.")]


//let arrayInstructions = [elevenInstructions]

//https://factrepublic.com/facts/7212/
