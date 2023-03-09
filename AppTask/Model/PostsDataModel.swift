//
//  PostsDataModel.swift
//  AppTask
//
//  Created by Mohamed Samaha on 08/03/2023.
//

import Foundation

struct PostsDataModel: Codable {
    
    let posts: [Posts]
}

struct Posts: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}
