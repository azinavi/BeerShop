//
//  ViewController.swift
//  BeerShop
//
//  Created by azinavi on 19/12/23.
//

import UIKit

class ViewController: UIViewController {
    let beerManager = BeerManager.shared
    
    @IBOutlet weak var totalForToday: UILabel!
    
    @IBOutlet weak var beer1Name: UILabel!
    @IBOutlet weak var beer1Volume: UILabel!
    @IBOutlet weak var beer1Price: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var beer2Name: UILabel!
    @IBOutlet weak var beer2Volume: UILabel!
    @IBOutlet weak var beer2Price: UILabel!
    @IBOutlet weak var beer2BuyButton: UIButton!
    
    @IBOutlet weak var beer3Name: UILabel!
    @IBOutlet weak var beer3Volume: UILabel!
    @IBOutlet weak var beer3Price: UILabel!
    @IBOutlet weak var beer3BuyButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        beer1Name.text = beerManager.defaultBeerList[0].name
        beer1Volume.text = String(beerManager.defaultBeerList[0].volume)
        beer1Price.text = "$" + String(beerManager.defaultBeerList[0].price)
        // 2
        beer2Name.text = beerManager.defaultBeerList[1].name
        beer2Volume.text = String(beerManager.defaultBeerList[1].volume)
        beer2Price.text = "$" + String(beerManager.defaultBeerList[1].price)
        // 3
        beer3Name.text = beerManager.defaultBeerList[2].name
        beer3Volume.text = String(beerManager.defaultBeerList[2].volume)
        beer3Price.text = "$" + String(beerManager.defaultBeerList[2].price)
        
        resetButton.layer.shadowRadius = 5.0
        
        buybeer1Button(self)
        
        resetStartNewDay(self.beerManager)
        
        }

    //1
    @IBAction func buybeer1Button(_ sender: Any) {
        buyButton.addTarget(self, action: #selector(addRevenuebyBeer1), for: .touchUpInside)
        
    }
    @objc func addRevenuebyBeer1() {
        if (beerManager.defaultBeerList[0].volume > 0) {
            let tempVolume: Double = beerManager.defaultBeerList[0].volume - 0.5
            beer1Volume.text = String(tempVolume)
            beerManager.defaultBeerList[0].volume = tempVolume
            
            let tempPrice: Double = beerManager.getRevenue() + beerManager.defaultBeerList[0].price
            totalForToday.text = String(tempPrice)
            beerManager.revenue = tempPrice
        } else {
            buyButton.setTitle("Beer is ended up!", for: .normal)
            buyButton.isEnabled = false
        }
        if (beerManager.defaultBeerList[0].volume > 0) {
            buyButton.isEnabled = true
        }
    }
    
    //2
    @IBAction func buyBeer2Button(_ sender: Any) {
        beer2BuyButton.addTarget(self, action: #selector(addRevenuebyBeer2), for: .touchUpInside)
    }
    @objc func addRevenuebyBeer2() {
        if (beerManager.defaultBeerList[1].volume > 0) {
            let tempVolume: Double = beerManager.defaultBeerList[1].volume - 0.5
            beer2Volume.text = String(tempVolume)
            beerManager.defaultBeerList[1].volume = tempVolume
            
            let tempPrice: Double = beerManager.getRevenue() + beerManager.defaultBeerList[1].price
            totalForToday.text = String(tempPrice)
            beerManager.revenue = tempPrice
        } else {
            beer2BuyButton.setTitle("Beer is ended up!", for: .normal)
            beer2BuyButton.isEnabled = false
        }
        if (beerManager.defaultBeerList[1].volume > 0) {
            beer2BuyButton.isEnabled = true
        }
    }
    
    //3
    @IBAction func buyBeer3Button(_ sender: Any) {
        beer3BuyButton.addTarget(self, action: #selector(addRevenuebyBeer3), for: .touchUpInside)
    }
    @objc func addRevenuebyBeer3() {
        if (beerManager.defaultBeerList[2].volume > 0) {
            let tempVolume: Double = beerManager.defaultBeerList[2].volume - 0.5
            beer3Volume.text = String(tempVolume)
            beerManager.defaultBeerList[2].volume = tempVolume
            
            let tempPrice: Double = beerManager.getRevenue() + beerManager.defaultBeerList[2].price
            totalForToday.text = String(tempPrice)
            beerManager.revenue = tempPrice
        } else {
            beer3BuyButton.setTitle("Beer is ended up!", for: .normal)
            beer3BuyButton.isEnabled = false
        }
        if (beerManager.defaultBeerList[2].volume > 0) {
            beer3BuyButton.isEnabled = true
        }
    }
    
    
    
    
    
    
    @IBAction func resetStartNewDay(_ sender: Any) {
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
    }
    @objc func reset() {
        beerManager.resetAll()
        beer1Volume.text = String(beerManager.defaultBeerList[0].volume)
        totalForToday.text = String(beerManager.getRevenue())
        if (beerManager.defaultBeerList[0].volume > 0) {
            buyButton.isEnabled = true
            buyButton.setTitle("Buy 0.5l", for: .normal)
        }
        beer2Volume.text = String(beerManager.defaultBeerList[1].volume)
        if (beerManager.defaultBeerList[1].volume > 0) {
            beer2BuyButton.isEnabled = true
            beer2BuyButton.setTitle("Buy 0.5l", for: .normal)
        }
        beer3Volume.text = String(beerManager.defaultBeerList[2].volume)
        if (beerManager.defaultBeerList[1].volume > 0) {
            beer3BuyButton.isEnabled = true
            beer3BuyButton.setTitle("Buy 0.5l", for: .normal)
        }
    }
    
    
    
}

