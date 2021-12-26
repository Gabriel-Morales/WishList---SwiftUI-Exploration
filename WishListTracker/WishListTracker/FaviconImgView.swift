//
//  FaviconImgView.swift
//  WishListTracker
//
//  Created by Gabriel Morales on 12/25/21.
//

import SwiftUI

struct FaviconImgView: View {
    
    let location: String?
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        
        if let favicon = ObtainFavicon.referenceLocation(locationName: location) {
            
            let faviconHeight = favicon.size.height
            let faviconWidth = favicon.size.width
            
            Image(uiImage: favicon).scaleEffect(x: height / faviconWidth, y: width / faviconHeight).frame(width: height, height: width)
            
        } else {
            
        }
        
    }
}

struct FaviconImgView_Previews: PreviewProvider {
    static var previews: some View {
        FaviconImgView(location: "steampowered", height: 40, width: 40)
    }
}
