//
//  Beer.swift
//  BeerShop
//
//  Created by azinavi on 19/12/23.
//

import Foundation
import UIKit

class Beer {
    let name: String
    let price: Double
    let country: String
    var volume: Double // Остаток объема

    init(name: String, price: Double, country: String, volume: Double) {
        self.name = name
        self.price = price
        self.country = country
        self.volume = volume
    }
    
//    func sold() {
//        let result = self.volume - 0.5
//        if (result > 0) {
//            self.volume = result
//        } else {
//            print("Sorry! Beer is ended!")
//        }
//    }
}
