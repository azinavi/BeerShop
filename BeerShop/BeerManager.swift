//
//  BeerManager.swift
//  BeerShop
//
//  Created by azinavi on 19/12/23.
//

import Foundation
import UIKit

class BeerManager {
    static let shared = BeerManager()
    var revenue: Double = 0 // Выручка
    var defaultBeerList: [Beer]
    
    private let beerList = [Beer(name: "Балтика", price: 1.0, country: "Russian", volume: 10.0), Beer(name: "Heineken", price: 2.0, country: "Holland", volume: 15.0), Beer(name: "Korona", price: 1.5, country: "Spain", volume: 20.0)]
    
    private init() {
        self.defaultBeerList = beerList
    }
    
    func getRevenue() -> Double {
        return self.revenue
    }
    
    func resetAll() {
        self.beerList[0].volume = 10.0
        self.beerList[1].volume = 15.0
        self.beerList[2].volume = 20.0
        self.revenue = 0
    }
    
//    func sellBeers(beer: Beer) {
//        revenue += beer.price
//        self.defaultBeerList = self.beerList.map { i in
//            if (i.name == beer.name) {
//                let copy = i
//                i.sold()
//                return copy
//            }
//            return i
//        }
//    }
//    
    
    
    
}
