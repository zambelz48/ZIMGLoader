//
//  MainViewController.swift
//  SampleApp
//
//  Created by Nanda Julianda Akbar on 31/05/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
	
	private let tableViewCellIdentifier = "mainExampleCell"
	
	private let tableView: UITableView = UITableView()
	
	private let pages: [[String : Any]] = [
		[
			"name": "Simple example",
			"viewController": SimpleExampleViewController()
		],
		[
			"name": "Advanced example",
			"viewController": AdvancedExampleViewController()
		]
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Browse Examples"
		self.view.backgroundColor = .white
		
		configureTableView()
	}
	
	private func layoutGuide() -> UILayoutGuide {
		return self.view.safeAreaLayoutGuide
	}
	
	private func configureTableView() {
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
		
		view.addSubview(tableView)
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: layoutGuide().topAnchor),
			tableView.bottomAnchor.constraint(equalTo: layoutGuide().bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: layoutGuide().leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: layoutGuide().trailingAnchor)
		])
		
		tableView.dataSource = self
		tableView.delegate = self
	}
}

extension MainViewController : UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath)
		cell.accessoryType = .disclosureIndicator
		
		cell.textLabel?.text = pages[indexPath.row]["name"] as? String
		
		return cell
	}
	
}

extension MainViewController : UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let viewController = pages[indexPath.row]["viewController"] as? UIViewController else {
			return
		}
		
		navigationController?.pushViewController(viewController, animated: true)
	}
	
}
