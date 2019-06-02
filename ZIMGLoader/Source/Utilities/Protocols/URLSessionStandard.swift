//
//  URLSessionStandard.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 02/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation

protocol URLSessionStandard {
	
	func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
	
}

extension URLSession : URLSessionStandard {
	
	static func defaultConfig() -> URLSession {
		let config = URLSessionConfiguration.default
		return URLSession(configuration: config)
	}
	
}
