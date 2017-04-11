//
//  ViewModel.swift
//  CocoaHeads-MVVM
//
//  Created by Eduardo Tolmasquim on 10/04/17.
//  Copyright © 2017 Eduardo. All rights reserved.
//

import Foundation
import UIKit

class AgeGameViewModel {
    
    weak var delegate:AgeGameProtocol?
    var lifetimes = [Lifetime]()

    func fetchLifetimes() {
        let dataProvider = DataProvider()
        dataProvider.getLifetimes(completion: {
            [weak self] lifetimes in
            self?.lifetimes = lifetimes
            self?.delegate?.showElements()
        })
    }
    
    func text(from age:Float)->String {
        return String(Int(age)) + " anos"
    }
    
    func getImageAndDescription(for age:Float)->(UIImage?,String) {
        let ageInt = Int(age)
        for lifetime in lifetimes {
            if lifetime.ageRange.covers(age: ageInt) {
                let image = UIImage(named:lifetime.imageName)
                let description = lifetime.name + "!"
                return (image,description)
            }
        }
        return (nil, "Que idade é essa?")
    }
}
