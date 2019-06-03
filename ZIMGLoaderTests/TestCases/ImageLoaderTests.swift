//
//  ImageLoaderTests.swift
//  ZIMGLoaderTests
//
//  Created by Nanda Julianda Akbar on 03/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import XCTest

class ImageLoaderTests: XCTestCase {

    override func setUp() {
		super.setUp()
    }

    override func tearDown() {
		
		super.tearDown()
    }

    func testSuccessfulDownloadImage() {
		
		let downloadExpectation = expectation(description: "Successful downloading image")
		
		let imageUrl = "https://images.unsplash.com/photo-1542141372-98a047557466?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80"
		
		ImageLoader.download(
			from: imageUrl,
			onSuccess: { (image: UIImage?) in
				XCTAssert(image != nil)
				downloadExpectation.fulfill()
			},
			onFailed: { (error: Error) in
				downloadExpectation.fulfill()
			}
		)
		
		wait(for: [ downloadExpectation ], timeout: 5.0)
    }
	
	func testFailedDownloadImage() {
		
		let downloadExpectation = expectation(description: "Failed downloading image")
		
		let imageUrl = "http://invalid-image-url.com"
		
		ImageLoader.download(
			from: imageUrl,
			onSuccess: { (image: UIImage?) in
				XCTAssert(image == nil)
				downloadExpectation.fulfill()
		},
			onFailed: { (error: Error) in
				XCTAssert(!error.localizedDescription.isEmpty)
				downloadExpectation.fulfill()
		}
		)
		
		wait(for: [ downloadExpectation ], timeout: 5.0)
	}

}
