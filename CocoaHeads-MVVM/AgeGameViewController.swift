//
//  ViewController.swift
//  CocoaHeads-MVVM
//
//  Created by Eduardo Tolmasquim on 10/04/17.
//  Copyright © 2017 Eduardo. All rights reserved.
//

import UIKit

class AgeGameViewController: UIViewController,AgeGameProtocol {

    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var bottonStackView: UIStackView!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var lifetimeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let viewModel = AgeGameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.fetchLifetimes()
    }

    @IBAction func didEndEditingAge(_ sender: UISlider) {
        let age = sender.value
        let (image, description) = viewModel.getImageAndDescription(for: age)
        imageView.image = image
        lifetimeLabel.text = description
    }
    
    @IBAction func didChangeAge(_ sender: UISlider) {
        let age = sender.value
        ageLabel.text = viewModel.text(from:age)
    }
    
    //MARK: AgeGameProtocol
    
    func showElements() {
        spinner.stopAnimating()
        topStackView.isHidden = false
        bottonStackView.isHidden = false
    }
}

