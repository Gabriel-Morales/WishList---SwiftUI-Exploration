//
//  WishListTrackerApp.swift
//  WishListTracker
//
//  Created by Gabriel Morales on 12/25/21.
//

import SwiftUI

@main
struct WishListTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            var wishItems = [WishListItem]()
            ContentView(wishItems: wishItems)
        }
    }
}
