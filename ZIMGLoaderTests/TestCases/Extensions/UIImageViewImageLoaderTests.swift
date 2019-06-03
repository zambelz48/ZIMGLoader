//
//  UIImageViewImageLoaderTests.swift
//  ZIMGLoaderTests
//
//  Created by Nanda Julianda Akbar on 03/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import XCTest

class UIImageViewImageLoaderTests: XCTestCase {

    override func setUp() {
		super.setUp()
    }

    override func tearDown() {
		super.tearDown()
    }

    func testLoadImage() {
		
		let loadExpectation = expectation(description: "load image expectation")
		
		let imageView = UIImageView(
			frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
		)
		
		DispatchQueue.main.async {
			if (imageView.image != nil) {
				XCTFail("image is not nil")
				loadExpectation.fulfill()
				return
			}
		}
		
		let option = ImageRequestOption(
			urlString: "https://images.unsplash.com/photo-1542141372-98a047557466?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80",
			placeholderImage: nil,
			loadingIndicator: nil,
			contentMode: .scaleToFill,
			cached: false
		)
		
		imageView.loadImage(with: option) {
			
			DispatchQueue.main.async {
				XCTAssert(imageView.image != nil)
			}
			
			loadExpectation.fulfill()
		}
		
		wait(for: [ loadExpectation ], timeout: 5.0)
    }

}
