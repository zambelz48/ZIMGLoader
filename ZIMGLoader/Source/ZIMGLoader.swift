//
//  ZIMGLoader.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 01/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation

open class ZIMGLoader {
	
	public static let shared = ZIMGLoader()
	
	private init() { }
	
	public func loadImage(from url: String) {
		print("an image from \(url)'s loaded....")
	}
	
}
