//
//  WIshListItemsModel.swift
//  WishListTracker
//
//  Created by Gabriel Morales on 12/26/21.
//

import Foundation

enum SumType {
    case Increase
    case Decrease
}

class WishListItemsModel: ObservableObject {
    
    @Published var wishListItems: [WishListItem]
    @Published var itemSum: Double = 0.0
    
    init(items: [WishListItem]) {
        wishListItems = items
        calculateSum()
    }
    
    func calculateSum()  {
        
        var sum = 0.0
        
        wishListItems.forEach { (item) -> Void in
            sum += item.itemPrice
        }
        
        itemSum = sum
        
    }
    
    func updateSum(withValue value: Double, andType type: SumType) {
        
        switch (type) {
        case .Decrease:
            itemSum -= value
        case .Increase:
            itemSum += value
        }
        
    }
    
    
}
