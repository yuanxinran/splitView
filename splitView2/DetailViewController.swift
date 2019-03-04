//
//  DetailViewController.swift
//  splitView2
//
//  Created by Anna Yuan on 2/26/19.
//  Copyright © 2019 Anna Yuan. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var animal: Animal? {
        didSet {
            refreshUI()
        }
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        nameLabel.text = animal?.name
        descriptionLabel.text = animal?.description
       
    }
    
}

extension DetailViewController: AnimalSelectionDelegate {
    func animalSelected(_ newAnimal: Animal) {
        animal = newAnimal
    }
}

