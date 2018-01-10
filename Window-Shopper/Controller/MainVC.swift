//
//  ViewController.swift
//  Window-Shopper
//
//  Created by Leo Espinal on 1/8/18.
//  Copyright © 2018 Leo Espinal. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var wageTxt: CurrencyTextField!
    @IBOutlet weak var priceTxt: CurrencyTextField!
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCalculateButtonToView()
        resultsLabel.isHidden = true
        hoursLabel.isHidden = true
    }
    
    
    @IBAction func clearCalculatorPressed(_ sender: Any) {
        resultsLabel.isHidden = true
        hoursLabel.isHidden = true
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
    @objc func calculate() {
        //Make sure fields arent empty
        if let wageTxt = wageTxt.text, let priceTxt = priceTxt.text {
            //Make sure input values in text field are Doubles
            if let wage = Double(wageTxt), let price = Double(priceTxt) {
                view.endEditing(true)
                resultsLabel.isHidden = false
                hoursLabel.isHidden = false
                //Set results label text to number of hours it takes to purchase item
                resultsLabel.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
                
            }
        }
    }
    
    func addCalculateButtonToView() {
        //Create the Calculate button and attach it to the text field as an accessory
        let calButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calButton.backgroundColor = #colorLiteral(red: 1, green: 0.7563767854, blue: 0.2894808301, alpha: 1)
        calButton.setTitle("Calculate", for: .normal)
        calButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calButton.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        //Set the accessory views for the text fields
        wageTxt.inputAccessoryView = calButton
        priceTxt.inputAccessoryView = calButton
    }

}

