//
//  UIImageView+ImageLoader.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 03/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
	
	public func loadImage(with option: ImageRequestOption, onFinish: (() -> ())? = nil) {
		
		let imageUrl = option.urlString
		let imageHandler = ImageCacheHandler.shared
		
		contentMode = option.contentMode
		
		if let cachedImage = imageHandler.getCachedImage(for: imageUrl) {
			DispatchQueue.main.async { [weak self] in
				self?.image = cachedImage
			}
			return
		}
		
		if image == nil, let placeholder = option.placeholderImage {
			DispatchQueue.main.async { [weak self] in
				self?.image = placeholder
			}
		}
		
		if let loadingIndicatorView = option.loadingIndicator {
			
			addSubview(loadingIndicatorView)
			
			loadingIndicatorView.translatesAutoresizingMaskIntoConstraints = false
			
			NSLayoutConstraint.activate([
				loadingIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
				loadingIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
			])
		}
		
		ImageLoader.download(
			from: imageUrl,
			onSuccess: { [weak self] (image: UIImage?) in
				
				guard let validImage = image else {
					let error = ErrorFactory.unknown.detail
					print("Load image error : \(error.localizedDescription)")
					return
				}
				
				if (option.cached) {
					imageHandler.storeToCache(with: option.urlString, image: validImage)
				}
				
				DispatchQueue.main.async {
					self?.image = validImage
					option.loadingIndicator?.removeFromSuperview()
				}
				
				onFinish?()
			},
			onFailed: { (error: Error) in
				print("Load image error : \(error.localizedDescription)")
				option.loadingIndicator?.removeFromSuperview()
				onFinish?()
			}
		)
	}
	
}
