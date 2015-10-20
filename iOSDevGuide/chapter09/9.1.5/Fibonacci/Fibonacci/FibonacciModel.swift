//
//  FibonacciModel.swift
//  Fibonacci
//
//  Created by aa64mac on 10/20/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import Foundation
public class FibonacciModel {
    public init() {}
    public func calculateFibonacciNumbers(minimum2 endOfSequence:Int) -> Array<Int> {
        
        var sequence: [Int] = [1, 1]
        for number in 2..<endOfSequence {
            let newFibonacciNumber = sequence[number - 1] + sequence[number - 2]
            sequence.append(newFibonacciNumber)
        }
        
        return sequence
    }
}