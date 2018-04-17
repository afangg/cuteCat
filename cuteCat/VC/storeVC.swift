//
//  storeVC.swift
//  cuteCat
//
//  Created by Alisha Fong on 4/11/18.
//  Copyright © 2018 Alisha Fong. All rights reserved.
//

import UIKit

class storeCell: UICollectionViewCell
{
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    
    
}
class storeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemArray = [StoreItem]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        var item = StoreItem(name: "Fish", description: "Increases rate by 2", price: "$50")
        itemArray.append(item)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! storeCell
        cell.itemName.text = itemArray[indexPath.row].itemName
        cell.itemPrice.text = itemArray[indexPath.row].itemPrice
        print(cell.itemName)
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(itemArray.count)
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! storeCell
        cell.itemName.text = itemArray[indexPath.row].itemName
        cell.itemPrice.text = itemArray[indexPath.row].itemPrice
        print(cell.itemName)
    }
    

}
