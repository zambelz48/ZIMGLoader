//
//  ImageCacheHandler.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 03/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation
import UIKit

open class ImageCacheHandler {
	
	public static let shared = ImageCacheHandler()
	
	private let cache = NSCache<NSString, UIImage>()
	
	private init() {
		cache.totalCostLimit = initialTotalCostLimit()
	}
	
	public func setCache(maxCapacity: Int) {
		cache.totalCostLimit = 1024 * 1024 * maxCapacity
	}
	
	public func clearCachedImages() {
		cache.removeAllObjects()
	}
	
	internal func storeToCache(with key: String, image: UIImage) {
		
		let cachedKey = NSString(string: key)
		
		cache.setObject(image, forKey: cachedKey)
	}
	
	internal func getCachedImage(for key: String) -> UIImage? {
		
		let cachedKey = NSString(string: key)
		guard let cachedImage = cache.object(forKey: cachedKey) else {
			return nil
		}
		
		return cachedImage
	}
	
	private func initialTotalCostLimit() -> Int {
		
		let physicalMemory = ProcessInfo.processInfo.physicalMemory
		let ratio = physicalMemory <= (1024 * 1024 * 512) ? 0.1 : 0.2
		let limit = physicalMemory / UInt64(1 / ratio)
		
		return limit > UInt64(Int.max) ? Int.max : Int(limit)
	}
	
}
