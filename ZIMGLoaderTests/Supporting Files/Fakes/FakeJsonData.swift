//
//  FakeJsonData.swift
//  ZIMGLoaderTests
//
//  Created by Nanda Julianda Akbar on 02/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import Foundation

final class FakeJsonData {
	
	static let sampleJson: [[String: Any]] = [
		[
			"sampleKeyOne": "Sample value from key 1.1",
			"sampleKeyTwo": "Sample from key 1.2"
		],
		[
			"sampleKeyOne": "Sample value from key 2.1",
			"sampleKeyTwo": "Sample from key 2.2"
		]
	]
	
	private init() {}
	
}
