//
//  CurrencyTextField.swift
//  Window-Shopper
//
//  Created by Leo Espinal on 1/8/18.
//  Copyright © 2018 Leo Espinal. All rights reserved.
//

import UIKit

//Have changes in this class show in interface builder using @IBDesignable
@IBDesignable
class CurrencyTextField: UITextField {
    
    //Don't implement this function if it's empty. Use when you want to add a subview to your view
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        //Use UI components with frames when creating a UI object programatically
        let currencyLabel = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2) - size / 2, width: size, height: size))
        currencyLabel.backgroundColor = #colorLiteral(red: 0.7161303889, green: 0.7161303889, blue: 0.7161303889, alpha: 0.8)
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        currencyLabel.layer.cornerRadius = 5.0
        //Set the clip to bounds property when working in the draw( rect) method for UI elements that need to be clipped
        currencyLabel.clipsToBounds = true
        
        //Create a NumberFormatter which will be use to create a currency symbol in the view which is customize based on the location where a device is from
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        //Set the symbol from the formatter to the currency label
        currencyLabel.text = formatter.currencySymbol
        addSubview(currencyLabel)
    }
    
    //Method called when interface builder is going to be loaded
    override func prepareForInterfaceBuilder() {
        customizeView()
    }

    //When the view is loaded, this method will be called at runtime
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView() {
        //Set attributes for the text field
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        
        clipsToBounds = true
        
        //Modify placeholder text if not nil
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}
