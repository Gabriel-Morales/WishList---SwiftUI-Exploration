//
//  WishListItem.swift
//  WishListTracker
//
//  Created by Gabriel Morales on 12/25/21.
//

import Foundation


struct WishListItem: Identifiable, Hashable {
    
    var itemName: String
    var id = UUID()
    var itemPrice: Double
    var itemLocation: String?
    
    
}
