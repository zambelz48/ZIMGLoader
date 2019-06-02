//
//  HttpHandler.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 02/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation

final class HttpHandler {
	
	private let session: URLSessionStandard
	
	private init(session: URLSessionStandard) {
		self.session = session
	}
	
	static func sharedInstance(session: URLSessionStandard) -> HttpHandler {
		return HttpHandler(session: session)
	}
	
	func request<T>(spec: HttpRequestSpec, onSuccess: @escaping (T?) -> (), onFailed: @escaping (Error) -> () = { _ in })
		where T: Codable {
			
			guard let request = configureRequest(with: spec) else {
				let error = ErrorFactory.by(type: .httpInvalidSpec).detail
				onFailed(error)
				return
			}
			
			let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
				
				if let validError = error {
					onFailed(validError)
					return
				}
				
				guard let validData = data, let validResponse = response as? HTTPURLResponse else {
					let error = ErrorFactory.unknown.detail
					onFailed(error)
					return
				}
				
				let decoder = JSONDecoder()
				let statusCode = validResponse.statusCode
				
				guard statusCode >= 200 && statusCode < 300 else {
					
					let errorType = ErrorType.httpError(code: statusCode)
					let error = ErrorFactory.by(type: errorType).detail
					
					onFailed(error)
					
					return
				}
				
				do {
					
					if (validData.isEmpty) {
						onSuccess(nil)
						return
					}
					
					let successData = try decoder.decode(T.self, from: validData)
					
					onSuccess(successData)
					
				} catch let parsingError {
					onFailed(parsingError)
				}
			}
			
			task.resume()
	}
	
	private func configureRequest(with spec: HttpRequestSpec) -> URLRequest? {
		
		guard let targetURL = URL(string: spec.url) else {
			return nil
		}
		
		var request = URLRequest(url: targetURL)
		request.httpMethod = spec.method.rawValue
		
		spec.headers.forEach { (key: String, value: String) in
			request.setValue(value, forHTTPHeaderField: key)
		}
		
		if (spec.parameters.count > 0) {
			let httpBody = try? JSONSerialization.data(withJSONObject: spec.parameters)
			request.httpBody = httpBody
		}
		
		return request
	}
	
}
