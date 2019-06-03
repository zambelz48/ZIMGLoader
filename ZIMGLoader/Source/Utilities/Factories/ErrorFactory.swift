//
//  ErrorFactory.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 02/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation

internal enum ErrorType {
	
	case httpInvalidSpec
	case httpError(code: Int)
	
	var code: Int {
		
		switch self {
			
		case .httpInvalidSpec:
			return -2
			
		case .httpError(let code):
			return code
			
		}
		
	}
}

internal enum ErrorFactory : Error {
	
	case unknown
	case by(type: ErrorType)
	
}

extension ErrorFactory {
	
	var detail: CommonError {
		
		switch self {
			
		case .unknown:
			
			let errorCode = -1
			let errorMessage = self.localizedDescription
			
			return CommonError(code: errorCode, message: errorMessage)
			
		case .by(let type):
			
			let errorCode = type.code
			let errorMessage = getErrorMessage(for: type)
			
			return CommonError(code: errorCode, message: errorMessage)
			
		}
		
	}
	
	private func getErrorMessage(for type: ErrorType) -> String {
		
		switch type {
			
		case .httpInvalidSpec:
			return "Invalid http request spec"
			
		case .httpError(let code):
			return HTTPURLResponse.localizedString(forStatusCode: code)
			
		}
		
	}
	
}
