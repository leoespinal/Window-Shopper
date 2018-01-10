//
//  Wage.swift
//  Window-Shopper
//
//  Created by Leo Espinal on 1/9/18.
//  Copyright © 2018 Leo Espinal. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price/wage))
    }
}
