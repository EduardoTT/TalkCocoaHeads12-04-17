//
//  DataProvider.swift
//  CocoaHeads-MVVM
//
//  Created by Eduardo Tolmasquim on 10/04/17.
//  Copyright © 2017 Eduardo. All rights reserved.
//

import Foundation

class DataProvider {
    
    func getLifetimes(completion:@escaping ([Lifetime])->Void) {
        
        let child = Lifetime(name: "Criança",
                             imageName: "child",
                             ageRange: AgeRange(min: 0, max: 17))
        
        let adult = Lifetime(name: "Adulto",
                             imageName: "adult",
                             ageRange: AgeRange(min: 18, max: 64))
        
        let aged = Lifetime(name: "Idoso",
                             imageName: "aged",
                             ageRange: AgeRange(min: 65, max: 100))
        

        let deadlineTime = DispatchTime.now() + .seconds(8)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            completion([child,adult,aged])
        }
    }
    
}
