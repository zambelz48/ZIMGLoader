//
//  ImageCacheHandlerTests.swift
//  ZIMGLoaderTests
//
//  Created by Nanda Julianda Akbar on 03/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import XCTest

class ImageCacheHandlerTests: XCTestCase {

	private var imageCacheHandler: ImageCacheHandler!
	
    override func setUp() {
		super.setUp()
		
		imageCacheHandler = ImageCacheHandler.shared
    }

    override func tearDown() {
		
		imageCacheHandler = nil
		
		super.tearDown()
    }

    func testSetCacheCapacity() {
		
		imageCacheHandler.setCache(maxCapacity: 100)
		
		let expectedCacheCapacity = 1024 * 1024 * 100
		
		XCTAssert(imageCacheHandler.getCacheCapacity() == expectedCacheCapacity)
    }
	
	func testSaveToCache() {
		
		let url = "http://sample-url.com"
		
		guard let sampleImage = sampleImage() else {
			XCTFail("failed to create sample image")
			return
		}
		
		imageCacheHandler.storeToCache(with: url, image: sampleImage)
		
		guard let cachedImage = imageCacheHandler.getCachedImage(for: url) else {
			XCTFail("Image not found in cache")
			return
		}
		
		XCTAssert(cachedImage == sampleImage)
	}
	
	func testClearCachedImages() {
		
		let url = "http://sample-url.com"
		
		guard let sampleImage = sampleImage() else {
			XCTFail("failed to create sample image")
			return
		}
		
		imageCacheHandler.storeToCache(with: url, image: sampleImage)
		
		guard let cachedImage = imageCacheHandler.getCachedImage(for: url) else {
			XCTFail("Image not found in cache")
			return
		}
		
		XCTAssert(cachedImage == sampleImage)
		
		imageCacheHandler.clearCachedImages()
		
		guard let _ = imageCacheHandler.getCachedImage(for: url) else {
			XCTAssert(true)
			return
		}
		
		XCTFail("Failed to clear caches")
	}
	
	private func sampleImage() -> UIImage? {
		
		let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 200))
		guard let cgImage = CIContext().createCGImage(CIImage(color: .red), from: frame) else {
			return nil
		}
		
		return UIImage(cgImage: cgImage)
	}

}
