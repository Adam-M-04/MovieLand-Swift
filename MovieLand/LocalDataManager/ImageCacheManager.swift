//
//  CacheManager.swift
//  MovieLand
//
//  Created by Adam Mąka on 17/08/2022.
//

import Foundation
import SwiftUI

let image_cache_manager = ImageCacheManager()

class ImageCacheManager {
    private let cache = NSCache<NSString, UIImage>()
    
    public func getImage(_ key: String) -> UIImage? {
        if let cachedVersion = cache.object(forKey: key as NSString) {
            return cachedVersion
        }
        return nil
    }
    
    public func setImage(_ key: String ,_ image: UIImage) {
        cache.setObject(image, forKey: key as NSString)
    }
}
