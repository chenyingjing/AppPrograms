//
//  main.swift
//  KVCpracticeInSwift
//
//  Created by aa64mac on 12/8/15.
//  Copyright © 2015 cyj. All rights reserved.
//

import Foundation

print("Hello, World!")

class People: NSObject {
    var name: String?
    var age: NSNumber?
    
    func initWithDictionary(dict: [String: AnyObject]) {
        self.setValuesForKeysWithDictionary(dict)
    }
}

var people: People = People()
people.name = "Jack"
people.age = 10
print(people.name!)
print(people.age!)
print(people.valueForKey("name")!)
print(people.valueForKey("age")!)
people.setValue("Tom", forKey: "name")
people.setValue(100, forKey: "age")
print(people.name!)
print(people.age!)

var dict = ["name": "Tim", "age": 15]
var tim: People = People()
tim.initWithDictionary(dict)
print(tim.name!)
print(tim.age!)

