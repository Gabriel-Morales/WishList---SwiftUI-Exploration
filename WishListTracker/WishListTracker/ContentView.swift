//
//  ContentView.swift
//  WishListTracker
//
//  Created by Gabriel Morales on 12/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var obsItems: WishListItemsModel
    
    var wishItems: [WishListItem]
    
    init(wishItems: [WishListItem]) {
        
        self.wishItems = wishItems
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(SwiftUI.Color.cyan)]
        
        self.obsItems = WishListItemsModel(items: wishItems)
    }
    
    var body: some View {

        NavigationView {

            List {
                
                ForEach(obsItems.wishListItems) { item in
                    
                    HStack {
                        
                        WishItemCellView(wishItem: item)
                        let price = String(format: "%.2lf", item.itemPrice)
                                    
                        Text("$\(price)").foregroundColor(.green).fontWeight(.bold)
                        
                    }
                    
                }.onDelete {(indexSet) -> Void in
                    
                    for index in indexSet {
                        let obj = obsItems.wishListItems.remove(at: index)
                        obsItems.updateSum(withValue: obj.itemPrice, andType: .Decrease)
                    }
                
                }
            
                    
                AddItemButton(itemListObs: obsItems)
                
            }.navigationBarTitle("Total: $\(String(format: "%.2lf", obsItems.itemSum))")

        }

    }
    
}


struct AddItemButton: View {
    
    @State private var showSheet = false
    
    @State var itemName: String = ""
    @State var itemLocation: String = ""
    @State var itemPrice: String = ""
    @State var addedItem: WishListItem? = nil
    
    @State var itemListObs: WishListItemsModel
    
    var body: some View {
        
        Section {
            
            Button {
                
                showSheet = true
                
            } label: {
                
                HStack {
                    
                    Image(systemName: "plus.circle.fill").foregroundColor(.cyan)
                    
                    Text("Add New Wishlist Item").foregroundColor(.cyan).fontWeight(.semibold)
                }
            }
            .sheet(isPresented: $showSheet) {
                
                NavigationView {
                    
                    List {
                        
                        TextField("Name", text: $itemName).onDisappear{() -> Void in itemName = ""}
                        TextField("Location (Ex: Apple)", text: $itemLocation).onDisappear{() -> Void in itemLocation = ""}
                        TextField("Price (Ex: 45.99)", text: $itemPrice).onDisappear{() -> Void in itemPrice = ""}
                        
                    }.navigationTitle("Add Item").navigationBarTitleDisplayMode(.inline).navigationBarItems(leading: Button { showSheet = false } label: {Text("Cancel")}, trailing: Button {
                        
                        addedItem = WishListItem(itemName: itemName, itemPrice: Double(itemPrice)!, itemLocation: itemLocation)
                        
                        
                        itemListObs.wishListItems.append(addedItem!)
                        
                        itemListObs.updateSum(withValue: addedItem!.itemPrice, andType: .Increase)
                        
                        showSheet = false
                        
                    } label: {Text("Done")})
                    
                }
                
            }
            
        }
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let wishItems = [WishListItem(itemName: "MacBook Pro", itemPrice: 1299.99, itemLocation: "Apple"), WishListItem(itemName: "iPad Pro", itemPrice: 1000.00, itemLocation: "Apple"),
            WishListItem(itemName: "Laptop Tote Bag", itemPrice: 38.22, itemLocation: "Amazon"),
                         WishListItem(itemName: "Hogwarts Legacy", itemPrice: 59.99, itemLocation: "steampowered")]
        
        ContentView(wishItems: wishItems)
.previewInterfaceOrientation(.portrait)
    }
}

