//
//  MainViewController.swift
//  SampleApp
//
//  Created by Nanda Julianda Akbar on 31/05/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
	
	private let imageView: UIImageView = UIImageView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .white
		
		configureImageView()
	}
	
	private func layoutGuide() -> UILayoutGuide {
		return self.view.safeAreaLayoutGuide
	}
	
	private func configureImageView() {
		
		imageView.backgroundColor = .gray
		
		self.view.addSubview(imageView)
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			imageView.centerXAnchor.constraint(greaterThanOrEqualTo: layoutGuide().centerXAnchor),
			imageView.centerYAnchor.constraint(greaterThanOrEqualTo: layoutGuide().centerYAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 200.0),
			imageView.heightAnchor.constraint(equalToConstant: 200.0)
		])
		
		loadImage()
	}
	
	private func loadImage() {
		
		let option = ImageRequestOption(
			urlString: "https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=1881cd689e10e5dca28839e68678f432",
			placeholderImage: nil,
			loadingIndicator: nil
		)
		
		imageView.loadImage(with: option)
	}

}
