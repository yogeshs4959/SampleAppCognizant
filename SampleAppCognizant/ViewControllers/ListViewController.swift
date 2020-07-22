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
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
    }
    
    var navTitle:String? {
        didSet {
            setupNavigationBar(title: navTitle)
        }
    }
    
    var listTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupNavigationBar(title: nil)
        setupTableView()
    }
    
    func setupNavigationBar(title:String?) {
        
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
        
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.tableFooterView = UIView()
    }

}


extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell()
        return cell
    }
    
}

