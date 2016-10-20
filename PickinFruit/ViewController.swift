//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        fruitPicker.delegate = self
        fruitPicker.dataSource = self
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultLabel.text = fruitsArray[row]
    }
    
    
    
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        let row1 = arc4random_uniform(UInt32(fruitsArray.count))
        let row2 = arc4random_uniform(UInt32(fruitsArray.count))
        let row3 = arc4random_uniform(UInt32(fruitsArray.count))
        let row4 = arc4random_uniform(UInt32(fruitsArray.count))
        
        
        fruitPicker.selectRow(Int(row1), inComponent: 0, animated: true)
        fruitPicker.selectRow(Int(row2), inComponent: 1, animated: true)
        fruitPicker.selectRow(Int(row3), inComponent: 2, animated: true)
        fruitPicker.selectRow(Int(row4), inComponent: 3, animated: true)
        
        let index1 = fruitPicker.selectedRow(inComponent: 0)
        let index2 = fruitPicker.selectedRow(inComponent: 1)
        let index3 = fruitPicker.selectedRow(inComponent: 2)
        let index4 = fruitPicker.selectedRow(inComponent: 3)
        
        if (index1 == index2) && (index2 == index3) && (index3 == index4) {
            resultLabel.text = "WINNER!"
        }
        else { resultLabel.text = "TRY AGAIN"
        }
        
    }
    
    
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



