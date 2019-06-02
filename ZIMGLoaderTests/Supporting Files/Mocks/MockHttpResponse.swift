//
//  MockHttpResponse.swift
//  ZIMGLoaderTests
//
//  Created by Nanda Julianda Akbar on 02/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation

final class MockHttpResponse {
	
	private init() {  }
	
	static func successfulURLSession() -> StubURLSession {
		return StubURLSession(statusCode: 200, fakeResponse: FakeJsonData.sampleJson)
	}
	
	static func failedURLSession() -> StubURLSession {
		return StubURLSession(statusCode: 400, fakeResponse: [])
	}
	
}
