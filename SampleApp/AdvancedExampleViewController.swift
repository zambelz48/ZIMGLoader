//
//  AdvancedExampleViewController.swift
//  ZIMGLoader
//
//  Created by Nanda Julianda Akbar on 03/06/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import UIKit

final class AdvancedExampleViewController: UIViewController {
	
	private let collectionViewSectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
	private let collectionViewItemsPerRow: CGFloat = 4
	
	private var collectionView: UICollectionView!
	
	private var data: [[String : Any]] = [
		[ "url": "https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=400&fit=max&s=d5682032c546a3520465f2965cde1cec" ],
		[ "url": "https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=400&fit=max&s=d5682032c546a3520465f2965cde1cec" ],
		[ "url": "https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=400&fit=max&s=d5682032c546a3520465f2965cde1cec" ],
		[ "url": "https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=400&fit=max&s=d5682032c546a3520465f2965cde1cec" ],
		[ "url": "https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=400&fit=max&s=d5682032c546a3520465f2965cde1cec" ],
		[ "url": "https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=400&fit=max&s=d5682032c546a3520465f2965cde1cec" ]
	]
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.title = "Advanced Example"
		self.view.backgroundColor = .white
		
		configureCollectionView()
    }
	
	private func layoutGuide() -> UILayoutGuide {
		return self.view.safeAreaLayoutGuide
	}
	
	private func configureCollectionView() {
		
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .vertical
		
		collectionView = UICollectionView(
			frame: view.frame,
			collectionViewLayout: flowLayout
		)
		collectionView.backgroundColor = .white
		collectionView.register(
			CustomCollectionViewCell.self,
			forCellWithReuseIdentifier: CustomCollectionViewCell.cellIdentifier
		)
		
		view.addSubview(collectionView)
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: layoutGuide().topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: layoutGuide().bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: layoutGuide().leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: layoutGuide().trailingAnchor)
		])
		
		collectionView.dataSource = self
		collectionView.delegate = self
	}
}

extension AdvancedExampleViewController : UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.cellIdentifier, for: indexPath) as? CustomCollectionViewCell else {
			return UICollectionViewCell()
		}

		if let imageUrl = data[indexPath.row]["url"] as? String {
			cell.setImage(from: imageUrl)
		}
		
		return cell
	}
	
}

extension AdvancedExampleViewController : UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let paddingSpace = collectionViewSectionInsets.left * (collectionViewItemsPerRow + 1)
		let availableWidth = view.frame.width - paddingSpace
		let widthPerItem = availableWidth / collectionViewItemsPerRow

		return CGSize(width: widthPerItem, height: widthPerItem)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return collectionViewSectionInsets
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return collectionViewSectionInsets.left
	}
	
}

final class CustomCollectionViewCell : UICollectionViewCell {
	
	static let cellIdentifier = "CustomCollectionViewCell"
	
	private let imageView: UIImageView = UIImageView()
	
	override func layoutSubviews() {
		
		contentView.addSubview(imageView)
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: topAnchor),
			imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
		
		super.layoutSubviews()
	}
	
	func setImage(from url: String) {
		
		imageView.loadImage(
			with: ImageRequestOption(
				urlString: url,
				placeholderImage: nil,
				loadingIndicator: nil
			)
		)
	}
	
}
