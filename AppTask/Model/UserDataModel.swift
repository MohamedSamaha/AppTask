//
//  PostDataModel.swift
//  AppTask
//
//  Created by Mohamed Samaha on 07/03/2023.
//

import Foundation

// MARK: ALL USER RETURNED DATA FROM POST REQUEST.
struct UserDataModel: Decodable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    let token: String
}
