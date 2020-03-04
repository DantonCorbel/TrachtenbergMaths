//
//  ContentsInfo.swift
//  TrachtenbergMaths
//
//  Created by Deb Santa Clara on 1/03/20.
//  Copyright © 2020 Deb Santa Clara. All rights reserved.
//

import Foundation

//let chapterHeadings = ["Basic Multiplication", "Rapid Multiplication"]

struct Content {
    var heading: String
    var chapters: [String]

}

enum Chapters {
    case one, two, three, four, five, six
    
//    func chapters(chapters: Chapters) -> Content {
//        switch self {
//        case .one:
//            return Content(heading: "Basic Multiplication", chapters: ["By 11", "By 12"])
//        default:
//            return Content(heading: "i", chapters: ["1","2"])
//        }
//    }
}

let chapter1 = Content(heading: "Basic Multiplication", chapters: ["By 11", "By 12"])

//https://factrepublic.com/facts/7212/
