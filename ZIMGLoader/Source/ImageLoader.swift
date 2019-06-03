//
//  ImageLoader.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 03/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation
import UIKit

open class ImageLoader {
	
	public class func download(from urlString: String, onSuccess: @escaping (UIImage?) -> (), onFailed: @escaping (Error) -> () = { _ in }) {
		
		let requestSpec = HttpRequestSpec(url: urlString)
		let urlSession = URLSession.defaultConfig()
		let httpHandler = HttpHandler.sharedInstance(session: urlSession)
		
		httpHandler.download(
			with: requestSpec,
			onSuccess: { (data: Data?) in
				
				guard let imageData = data, let image = UIImage(data: imageData) else {
					
					let error = ErrorFactory.unknown.detail
					onFailed(error)
					
					return
				}
				
				onSuccess(image)
			},
			onFailed: onFailed
		)
		
	}
}
