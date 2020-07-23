//
//  ItemTableViewCell.swift
//  SampleAppCognizant
//
//  Created by nous on 23/07/20.
//  Copyright © 2020 yogesh. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var itemImage: UIImageView!
    var titleText: UILabel!
    var descriptionText: UILabel!
    var item: Item? {
        didSet {
            itemImage.load(urlString: item?.imageUrl ?? "", defaultImage: "imagePlaceholder")
            titleText.text = item?.title
            descriptionText.text = item?.description
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        itemImage = UIImageView()
        contentView.addSubview(itemImage)
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        itemImage.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        itemImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        itemImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        titleText = UILabel()
        contentView.addSubview(titleText)
        titleText.numberOfLines = 0
        titleText.font = UIFont.boldSystemFont(ofSize: 18)
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleText.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 10).isActive = true
        titleText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10).isActive = true
        titleText.centerYAnchor.constraint(equalTo: itemImage.centerYAnchor, constant: 0).isActive = true
        
        descriptionText = UILabel()
        descriptionText.numberOfLines = 0
        contentView.addSubview(descriptionText)
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10).isActive = true
        descriptionText.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 10).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
