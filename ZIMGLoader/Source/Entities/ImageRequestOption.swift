//
//  ImageRequestOption.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 03/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation
import UIKit

public struct ImageRequestOption {
	
	let urlString: String
	let placeholderImage: UIImage?
	let loadingIndicator: UIView?
	let contentMode: UIView.ContentMode
	let cached: Bool
	
	public init(
		urlString: String,
		placeholderImage: UIImage?,
		loadingIndicator: UIView?,
		contentMode: UIView.ContentMode = .scaleToFill,
		cached: Bool = true)
	{
		
		self.urlString = urlString
		self.placeholderImage = placeholderImage
		self.loadingIndicator = loadingIndicator
		self.contentMode = contentMode
		self.cached = cached
	}
	
	func getHttpRequestSpec() -> HttpRequestSpec {
		return HttpRequestSpec(url: urlString)
	}
	
}
