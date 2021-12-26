//
//  WishItemCellView.swift
//  WishListTracker
//
//  Created by Gabriel Morales on 12/25/21.
//

import SwiftUI

struct WishItemCellView: View {
    
    let wishItem: WishListItem
    
    var body: some View {
        
        HStack(spacing: .zero){
            
            FaviconImgView(location: wishItem.itemLocation, height: 35, width: 35).padding()
            
            
            VStack(alignment: .leading) {
                
                Text(wishItem.itemName)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.cyan)
                    
                if let itemlocation =
                    wishItem.itemLocation {
                    Text(itemlocation)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                         
                } else {
                    Text("Site not specified.")
                }
                
            }
            
            Spacer()
            
        }
    }
}

struct WishItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        let item = WishListItem(itemName: "The Witcher 3", itemPrice: 59.99, itemLocation: "steampowered")
        
        WishItemCellView(wishItem: item)
    }
}
