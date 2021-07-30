//
//  TableViewController.swift
//  swift-essentials
//
//  Created by Nitesh  on 21/05/21.
//  Copyright © 2021 nitpa.org. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

        // MARK: - Properties
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 60
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Initialisation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TableView"
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.navigationBar.tintColor = .label
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didTapDissmiss))
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    // MARK: - Handlers

    @objc fileprivate func didTapDissmiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.nameLabel.text = "this is row \(indexPath.row)"
        cell.logoItem.image = UIImage(systemName: "bell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
