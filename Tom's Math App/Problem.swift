//
//  Problem.swift
//  Tom's Math App
//
//  Created by David Brunow on 7/23/15.
//  Copyright (c) 2015 ShepherdDog. All rights reserved.
//

import Foundation

class Problem: NSObject
{
    var equationType: String = ""
    var answerType: String = ""
    var numberOfAnswersToShow: Int = 0
    var answer: Int = 0
    
    func generateQuestion() -> String
    {
        switch equationType
        {
        case "Addition":
            // generate random numbers
            let firstNumber = Int(arc4random_uniform(10))
            let secondNumber = Int(arc4random_uniform(10))
            
            answer = firstNumber + secondNumber
            
            return "\(firstNumber) + \(secondNumber)"
        default:
            return ""
        }
    }
}