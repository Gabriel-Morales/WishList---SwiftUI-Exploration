//
//  UrlParser.swift
//  WishListTracker
//
//  Created by Gabriel Morales on 12/25/21.
//

import Foundation
import SwiftUI

struct ObtainFavicon {
    
    static func referenceLocation(locationName loc: String?) -> UIImage? {
        
        guard var location = loc else {
            return nil
        }
        
        location = location.replacingOccurrences(of: " ", with: "")
        
        if let safeURL = URL(string: "https://www.\(location).com/favicon.ico") {
            
            if let data = try? Data(contentsOf: safeURL), let uiimg = UIImage(data: data) {
                return uiimg
            }
        }
        
        if let unsafeURL = URL(string: "http://www.\(location).com/favicon.ico") {
            
            if let data = try? Data(contentsOf: unsafeURL), let uiimg = UIImage(data: data) {
                return uiimg
            }
        }
        
        return nil
        
    }
    
    
    
}
