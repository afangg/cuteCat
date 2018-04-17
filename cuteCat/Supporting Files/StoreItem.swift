//
//  StoreItem.swift
//  cuteCat
//
//  Created by Alisha Fong on 4/16/18.
//  Copyright © 2018 Alisha Fong. All rights reserved.
//

import Foundation

class StoreItem
{
    var itemName = "Name"
    var itemDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    var itemPrice = "0.00"
    
    init(name: String, description: String, price: String)
    {
        itemName = name
        itemDescription = description
        itemPrice = price
        
    }
    
    init(){}
    
    
}
