//
//  StubSessionDataTask.swift
//  ZIMGLoaderTests
//
//  Created by Nanda Julianda Akbar on 02/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation

final class StubSessionDataTask : URLSessionDataTask {
	
	typealias Response = (data: Data?, urlResponse: URLResponse?, error: Error?)
	
	var mockResponse: Response
	let completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
	
	init(response: Response, completionHandler: ((Data?, URLResponse?, Error?) -> Void)?) {
		self.mockResponse = response
		self.completionHandler = completionHandler
	}
	
	override func resume() {
		completionHandler!(mockResponse.data, mockResponse.urlResponse, mockResponse.error)
	}
	
}
