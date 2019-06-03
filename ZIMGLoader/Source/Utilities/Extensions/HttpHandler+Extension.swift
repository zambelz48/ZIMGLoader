//
//  HttpHandler+Extension.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 02/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation
import UIKit

extension HttpHandler {
	
	func jsonRequest<T>(spec: HttpRequestSpec, onSuccess: @escaping (T?) -> (), onFailed: @escaping (Error) -> () = { _ in })
		where T: Codable {
			
			var requestSpec = spec
			requestSpec.appendHeader(key: "application/json", value: "Content-Type")
			
			return request(spec: requestSpec, onSuccess: onSuccess, onFailed: onFailed)
	}
	
	func download(with spec: HttpRequestSpec, onSuccess: @escaping (Data?) -> (), onFailed: @escaping (Error) -> () = { _ in }) {
		request(spec: spec, onSuccess: onSuccess, onFailed: onFailed)
	}
	
}
