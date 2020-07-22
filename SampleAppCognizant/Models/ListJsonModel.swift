//
//  ListJsonModel.swift
//  SampleAppCognizant
//
//  Created by nous on 22/07/20.
//  Copyright © 2020 yogesh. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let title: String?
    let description: String?
    let imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case imageUrl = "imageHref"
    }
}

struct List: Decodable {
    let navigationTitle: String?
    let items: [Item]?
    
    private enum CodingKeys: String, CodingKey {
        case navigationTitle = "title"
        case items = "rows"
    }
}
