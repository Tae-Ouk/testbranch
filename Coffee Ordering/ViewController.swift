//
//  ViewController.swift
//  Coffee Ordering
//
//  Created by TaeOuk Hwang on 4/1/24.
//

// ViewController.swift

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var CoffeeListSelector: UISegmentedControl!
    @IBOutlet weak var CoffeListCollection: UICollectionView!
    
    let coffeeDataSet = [
        ["name": "아메리카노", "image": "coffee1.jpg", "price": "2500"],
        ["name": "카페라떼", "image": "coffee2.jpg", "price": "4000"],
        ["name": "에스프레소", "image": "coffee3.jpg", "price": "2000"]
    ]

    let teaDataSet = [
        ["name": "케모마일티", "image": "tea1.jpg", "price": "4000"],
        ["name": "아이스티", "image": "tea2.jpg", "price": "3500"],
        ["name": "레몬티", "image": "tea3.jpg", "price": "4000"],
        ["name": "그린티", "image": "tea4.jpg", "price": "3500"]
    ]

    let cakeDataSet = [
        ["name": "블루베리치즈케익", "image": "cake1.jpg", "price": "6000"],
        ["name": "바스크 치즈케익", "image": "cake2.jpg", "price": "5500"],
        ["name": "당근 케익", "image": "cake3.jpg", "price": "6500"]
    ]

    var currentDataSet: [[String : String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoffeeListSelector.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        CoffeListCollection.isHidden = false
        
        currentDataSet = coffeeDataSet
    }
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentDataSet = coffeeDataSet
        case 1:
            currentDataSet = teaDataSet
        case 2:
            currentDataSet = cakeDataSet
        default:
            break
        }
        CoffeListCollection.reloadData()
    }
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentDataSet.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CoffeeListCollectionCell
        
        let item = currentDataSet[indexPath.item]
        
        if let imageName = item["image"], let image = UIImage(named: imageName) {
            cell.coffeeImage.image = image
        }
        
        if let name = item["name"] {
            cell.coffeeLabel.text = name
        }
        
        return cell
    }

}
