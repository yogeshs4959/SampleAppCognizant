//
//  ViewController.swift
//  SampleAppCognizant
//
//  Created by nous on 21/07/20.
//  Copyright © 2020 yogesh. All rights reserved.
//

import UIKit
import Foundation

class ListViewController: UIViewController {
    
    var listItems = [Item]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.refreshControl.endRefreshing()
                self?.listTableView.reloadData()
            }
        }
    }
    var navTitle:String? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.setupNavigationBar(title: self?.navTitle)
            }
        }
    }
    var listTableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(ListViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    var viewModel:ListViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupNavigationBar(title: nil)
        setupTableView()
        viewModel?.listItems.bind({items in
            self.listItems = items
        })
        viewModel?.navTitle.bind({ title in
            self.navTitle = title
        })
        viewModel?.getListItems()
    }
    
    func setupNavigationBar(title:String?) {
        self.title = title
    }
    
    func setupTableView() {
        listTableView = UITableView()
        self.view.addSubview(listTableView)
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        listTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        listTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        listTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        listTableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")
        
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.allowsSelection = false
        listTableView.tableFooterView = UIView()
        listTableView.estimatedRowHeight = 120.0
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.addSubview(refreshControl)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        viewModel?.getListItems()
    }

}


extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        cell.item = listItems[indexPath.row]
        return cell
    }
    
}

