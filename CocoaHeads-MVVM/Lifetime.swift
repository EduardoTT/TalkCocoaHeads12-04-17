//
//  Lifetime.swift
//  CocoaHeads-MVVM
//
//  Created by Eduardo Tolmasquim on 10/04/17.
//  Copyright © 2017 Eduardo. All rights reserved.
//

import Foundation

struct Lifetime {
    var name:String
    var imageName:String
    var ageRange:AgeRange
}

struct AgeRange {
    var min:Int
    var max:Int
    
    func covers(age:Int)->Bool {
        return age >= min && age <= max
    }
}
