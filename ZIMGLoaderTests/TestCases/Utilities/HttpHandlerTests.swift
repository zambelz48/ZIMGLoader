//
//  HttpHandlerTests.swift
//  ZIMGLoaderTests
//
//  Created by Nanda Julianda Akbar on 02/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import XCTest

struct SampleJSON : Codable {
	let sampleKeyOne: String
	let sampleKeyTwo: String
}

class HttpHandlerTests: XCTestCase {
	
	private var httpRequestSpec: HttpRequestSpec!
	
    override func setUp() {
        super.setUp()
		
		httpRequestSpec = HttpRequestSpec(url: "http://test.com")
    }

    override func tearDown() {
		
		httpRequestSpec = nil
		
		super.tearDown()
    }

	func testSuccessfulHttpRequest() {
		
		let requestExpectation = expectation(description: "Expected the request getting called and success")
		
		let httpHandler = HttpHandler.sharedInstance(session: MockHttpResponse.successfulURLSession())
		httpHandler.jsonRequest(spec: httpRequestSpec, onSuccess: { (response: [SampleJSON]?) in
			
			guard let validResponse = response else {
				XCTFail("Invalid response")
				return
			}
			
			XCTAssert(validResponse.count == FakeJsonData.sampleJson.count)
			
			requestExpectation.fulfill()
		})
		
		wait(for: [ requestExpectation ], timeout: 1.0)
	}
	
}
